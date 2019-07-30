//
//  BiConversationPresenter.swift
//  NetworkingRetrier
//
//  Created by Mohammad Alhaj on 4/28/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import UIKit
import SwiftLinkPreview

protocol BiConversationView: class {
    
    func didSendMessage()
    func didFinishLoadingMore()
    func setSeenMutation(_ lastMessageInChat: MessageModel?)
    func setUserStatus(status: String)
    
    func didReceiveUserMessages()
    func didReceiveTextMessage()
    func didReceiveImageMessage()
    func didReceiveConversationMessages()
    func didReceiveTyping(action :TypingAction)
    func didReceiveSeen()
    func didReceiveDelivered()
    
}

class BiConversationPresenter {
    
    private var messages: [MessageModel] = []
    private var lastMessageId: Int?
    
    /// typing timer
    private var typingTimer: Timer?
    private var typing: Bool?
    
    
    ///onlineStatus timer
    private var onlineStatusTimer: Timer?
    
    private let chatService: ChatService?
    private let userService: UserService?
    weak var view: BiConversationView?
    private var appSyncHelper: AWSAmplifyHelper?
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

    init(_ services: ChatService, userService: UserService) {
        self.chatService = services
        self.userService = userService
        appSyncHelper = appDelegate.amplifyHelper
        messages = DBHelper.shared.getMessages(convsId)
    }
    
    deinit {
        print("presenter deintialized")
    }
    
    func attachView(view: BiConversationView) {
        self.view = view
        appSyncHelper = appDelegate.amplifyHelper
        appSyncHelper?.subscribtionResultHandlingDelegate = self
        appSyncHelper?.connectionStateChangeHandlerDelegate = self
        getUserOnlineStatus()
        appSyncHelper?.changeOnlineStatus(senderId: senderId, isOnline: true)
    }
    
    func detachView() {
        appSyncHelper?.changeOnlineStatus(senderId: senderId, isOnline: false)
        stopOnlineStatusTimer()
        view = nil
        appSyncHelper?.subscribtionResultHandlingDelegate = nil
        appSyncHelper?.connectionStateChangeHandlerDelegate = nil
        appSyncHelper = nil
    }

    func getConversationMessages(fetchCount: Int, lastMessageId: Int? = nil, loadMore: Bool) {
        appSyncHelper?.getConversatoinMessages(senderId: senderId, conversatoinId: convsId, fetchCount: fetchCount, lastMessageId: lastMessageId, completion: {[weak self] (result) in
            switch result {
                
            case .success(let value):
                do {
                    guard let jsonObject = value?.data?.jsonObject else {return} //serialization and mirror coding keys
                    
                    var biConversationJSONArray = jsonObject.map{$0.value}
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: biConversationJSONArray[0], options: .prettyPrinted)
                    let biConversationMessages = try JSONDecoder().decode([MessageModel].self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self?.messages.insert(contentsOf: biConversationMessages.reversed(), at: 0)
                        DBHelper.shared.saveMessages(self?.messages ?? [])
                        !(self?.messages.isEmpty ?? true) ? self?.lastMessageId = Int(self?.messages.first?.messageId ?? "") ?? 0 : print("")
                        loadMore ? self?.view?.didFinishLoadingMore() : self?.view?.didReceiveConversationMessages(); self?.view?.setSeenMutation(self?.messages.last)
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func getConversationMessages() {
        self.messages = DBHelper.shared.getMessages(convsId)
        self.view?.didReceiveConversationMessages()
    }
    
    func openURL(at indexPath: IndexPath) {
        guard let url = URL(string: messages[indexPath.section].link?.url ?? "") else {
            return //be safe
        }
        print(UIApplication.shared.canOpenURL(url))
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    @objc func loadMoreMessages() {
        if lastMessageId != nil {
            getConversationMessages(fetchCount: 10, lastMessageId: lastMessageId, loadMore: true)
            return
        }
    }
    
    func getMetaDataFromURL(text: String, completion: @escaping(URL?, URL?, String, String, String, String)->Void) {
        //pull from openGraph and get metaType
        //guard let url = slp.extractURL(text: text) else {return}
        
        
        let slp = SwiftLinkPreview(cache: InMemoryCache())
        
        if let result = slp.cache.slp_getCachedResponse(url: text) {
            print(result)
            // Do whatever with the cached response
            completion(result.url,
                       result.finalUrl,
                       result.title ?? "",
                       result.description ?? "",
                       result.image ?? "",
                       result.icon ?? "")
        } else {
            // Perform preview otherwise
            slp.preview(text,
                        onSuccess: { result in
                            print("\(result)")
                            
                            completion(result.url,
                                       result.finalUrl,
                                       result.title ?? "",
                                       result.description ?? "",
                                       result.image ?? "",
                                       result.icon ?? "")
            },
                        onError: { error in
                            print("\(error)")
            })
        }
    }
    
    //set seen to last message which is not from the current sender
    func setLastMessageReceivedSeen() {
        guard let lastMessage = messages.last, let senderID = Int(lastMessage.sender.senderId) else {return}
        if senderID != senderId {
            setMessageSeen()
            messages.forEach{$0.status = .seen}
            DBHelper.shared.saveMessages(messages)
            view?.didReceiveSeen()
        }
    }
    
    func sendTextMessage(text: String) {
        // here check for validation and
        //        if isLink(text) {
        //            //use openGraph top get and fill linkModel
        //            getMetaDataFromURL(text: text, completion: {[weak self] (url, finalUrl, title, description, image, icon) in
        //                self?.sendLinkMessage(linkMessage: LinkModel(url: finalUrl?.absoluteString, title: title, description: description, thumbnail: image))
        //            })
        //        } else {let timestamp = NSDate().timeIntervalSince1970
        let timeStamp = (Date().timeIntervalSince1970)
        let message = MessageModel(status: .sent, localId: Int(timeStamp), userId: senderId, conversationId: convsId, displayName: "\(senderId)", mType: .text, text: text, timestamp:  Int(timeStamp))
        
        DBHelper.shared.saveMessage(message)
        messages.append(message)
        view?.didSendMessage()
        appSyncHelper?.sendTextMessageMutation(receiverId: receiverId, senderId: senderId, localId: timeStamp, conversationId: convsId, text: text, completion: { msgId in
            guard let messageId = msgId else {return}
            message.msgId = messageId
            DBHelper.shared.save(message)//(using: message.localId ?? 0, with: message)

            //        let textFormatted = String(format: " \n %@", text)
            //        let paragraphStyle = NSMutableParagraphStyle()
            //        paragraphStyle.alignment = .center
            //        let attributedString = NSMutableAttributedString(string: textFormatted, attributes: [NSAttributedString.Key.paragraphStyle:paragraphStyle])
            //        let textAttachment = NSTextAttachment()
            //        textAttachment.image = pickedImage
            //        textAttachment.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
            //
            //        let attrStringWithImage = NSAttributedString(attachment: textAttachment)
            //        attributedString.insert(attrStringWithImage, at: 0)
            //
            //        self.messages.append(MessageModel(messageId: String(0), seen: false, sender: Sender(id: "\(senderId)", displayName: "\(senderId)"), kind: .attributedText(attributedString)))
        })
        
    }
    
    func sendLinkMessage(linkMessage: LinkModel?) {
        guard let linkMsg = linkMessage else {return}
        appSyncHelper?.sendLinkPreviewMutation(receiverId: receiverId, senderId: senderId, localId: 0, conversationId: convsId, linkPreview: linkMsg, completion: {[weak self] msgId in
            guard let messageId = msgId else {return}
            self?.messages.append(MessageModel(status: .sent, msgId: messageId, userId: senderId, conversationId: convsId, displayName: "\(senderId)", mType: .link, text: "", link: linkMsg, timestamp: Int(Date().timeIntervalSince1970)))
            
            self?.view?.didSendMessage()
        })
    }
    
    func isLink(_ text: String) -> Bool {
        return text.isValidURL()
    }
    
    func sendImage(image: UIImage) {
        //update image URL
        let timeStamp = (Date().timeIntervalSince1970)
        let message = MessageModel(status: .sent, localId:  Int(timeStamp), userId: senderId, conversationId: convsId, displayName: "\(senderId)", mType: .image, timestamp:  Int(timeStamp))
        DBHelper.shared.saveMessage(message)
        messages.append(message)
        view?.didSendMessage()
        
        chatService?.uploadImage(userImage: image, conversationId: convsId) { [weak self] (imageModel) in
            
            guard !imageModel.isEmpty else {return}
            self?.appSyncHelper?.sendImageMessageMutation(receiverId: receiverId, localId: message.localId ?? 0, convoId: convsId, senderId: senderId, url: imageModel[0].path ?? "", completion: {[weak self] (msgId) in
                guard let messageId = msgId else {return}
                message.msgId = messageId
                message.url = imageModel[0].path

                DBHelper.shared.save(message)
                //DBHelper.shared.updateMessageID(using: message.localId ?? 0, with: message)
                self?.view?.didSendMessage()
            })
        }
    }
    
    func setMessageSeen() {
        self.appSyncHelper?.setMessageSeenMutation(receiverId: receiverId, conversationId: convsId, lastMessageSeenId: Int(messages.last?.messageId ?? "") ?? 0)
    }
    
    func startTypingTimer() {
        setUserTyping(.on)
        typingTimer?.invalidate()
        typingTimer = nil
        typingTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(stoppedTyping), userInfo: nil, repeats: false)
        
    }
    
    
    @objc func stoppedTyping() {
        setUserTyping(.off)
        typingTimer?.invalidate()
        typingTimer = nil
    }
    
    
    func setUserTyping(_ action: TypingAction) {
        switch action {
        case .on:
            guard typing != nil else {
                typing = true
                appSyncHelper?.typingMutation(receiverId: receiverId, conversatoinId: convsId, senderId: senderId, action: .on)
                return }
        case .off:
            typing = nil
            appSyncHelper?.typingMutation(receiverId: receiverId, conversatoinId: convsId, senderId: senderId, action: .off)
        }
    }
    
    @objc func stopOnlineStatusTimer() {
        onlineStatusTimer?.invalidate()
        onlineStatusTimer = nil
    }
    
    func getUserOnlineStatus() {
        onlineStatusTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(changeOnlineStatus), userInfo: nil, repeats: true)
    }
    
     @objc private func changeOnlineStatus() {
        self.appSyncHelper?.changeOnlineStatus(senderId: senderId, isOnline: true)
        appSyncHelper?.getOnlineStatus(userId: receiverId, completion: { [weak self](timeStamp, isOnline) in
            self?.view?.setUserStatus(status: isOnline ? "Online" : MessageKitDateFormatter.shared.getFormattedLastSeen(timeStamp: Int(timeStamp) ?? 0))
        })
    }
    
    
    func getLastIndexPath() -> IndexPath {
        return IndexPath(item: 0, section: messageListCount() - 1)
    }
    
    func getMessageItem(for indexPath: IndexPath) -> MessageModel {
        return messages[indexPath.section]
        
    }
    
    func getTypingIndecator(for indexPath: IndexPath) -> MessageModel {
        return messages[indexPath.section - 1]
        
    }
    
    func messageListCount() -> Int {
        return messages.count
    }
    
    func isMessagesListEmpty() -> Bool {
        return messages.isEmpty
    }
    
    func getSenderId() -> Int {
        return senderId
    }
    
}

extension BiConversationPresenter: SubscribtionResultHandlerDelegate {
    func didReceiveConversations() {
        
    }
    
    
    func didReceiveMessagesFromUserMessagesQuery() {
        messages = DBHelper.shared.getMessages(convsId)
        self.view?.didReceiveUserMessages()
        setLastMessageReceivedSeen()
    }
    
    func didReceiveMessageResult(messageModel: SubscribeByUserIdSubscription.Data.SubscribeByUserId.Message, mType: MsgType) {
        
        lastMessageId = messageModel.messageId
        let timeStamp = (Date().timeIntervalSince1970)
        
        
        switch mType {
        case .text:
            
            let message = MessageModel(status: .seen, msgId: messageModel.messageId, userId: messageModel.userId, conversationId: convsId, displayName: "\(messageModel.userId)", mType: .text, text: messageModel.text, timestamp: Int(timeStamp))
            messages.append(message)
            
            self.view?.didReceiveTextMessage()
            setMessageSeen()
        case .image:
            
            let message = MessageModel(status: .seen, msgId: messageModel.messageId, userId:  messageModel.userId, conversationId: convsId, displayName: "\(messageModel.userId)", mType: .image, url: messageModel.url ?? "", timestamp: Int(Date().timeIntervalSince1970))
            messages.append(message)
            
            self.view?.didReceiveImageMessage()
            setMessageSeen()
        default: break
        }
        
    }
    
    func didRecieveSeenTrigger(seenModel: SubscribeByUserIdSubscription.Data.SubscribeByUserId.Seen) {
        messages.forEach{$0.status = .seen}
        DBHelper.shared.saveMessages(messages)
        view?.didReceiveSeen()
    }
    
//    func didRecieveDeliveredTrigger(deliveredModel: SubscribeByUserIdSubscription.Data.SubscribeByUserId.Delivered) {
//        messages.filter{$0.messageId.contains("\(deliveredModel.lastMsgDeliveredId)")}.forEach{$0.status = .delivered}
//        view?.didReceiveDelivered()
//    }
    
    func didRecieveTypingTrigger(typingModel: SubscribeByUserIdSubscription.Data.SubscribeByUserId.Typing) {
        guard let action = TypingAction(rawValue: typingModel.action) else {return}
        
        switch action {
        case .on:
            view?.didReceiveTyping(action: .on)
            
        case .off:
            view?.didReceiveTyping(action: .off)
        }
    }
    
    
}

extension BiConversationPresenter: ConnectionStateChangeHandlerDelegate {
    
    func connectionDidBecomeOffline() {
        print("presenter saw is offline")
    }
    
    func connectionDidBecomeOnline() {
        print("presenter saw is online")
    }
    
}

