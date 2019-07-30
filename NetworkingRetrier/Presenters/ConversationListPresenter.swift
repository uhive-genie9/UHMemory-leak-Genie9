//
//  ConversationListPresenter.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 6/16/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import UIKit

protocol ConversationListView: class {
    func setSucceeded()
    func didCreateConversation()
}

class ConversationListPresenter {
    
    weak var view: ConversationListView?
    private let chatService: ChatService?
    private var appSyncHelper: AWSAmplifyHelper?
    private var conversationsList: [ConversationModel]?
    
    init(_ chatService: ChatService) {
        self.chatService = chatService
        appSyncHelper = (UIApplication.shared.delegate as! AppDelegate).amplifyHelper
    }
  
    deinit {
        print("presenter deintialized")
    }
    
    func attachView(_ view: ConversationListView) {
        self.view = view
        appSyncHelper?.subscribtionResultHandlingDelegate = self
    }
    
    func detachView() {
        self.view = nil
        appSyncHelper?.subscribtionResultHandlingDelegate = nil
    }
    
    func assembleConversationList() {
        conversationsList = DBHelper.shared.getConversations()
//        conversationsList?.forEach{$0.message = DBHelper.shared.getMessages($0.conversationId ?? 0)}
        view?.setSucceeded()
    }
    
    func getConversationsData() -> [ConversationModel]? {
        return conversationsList
    }
    
    func startNewConversation(with receiverId: Int) {
        appSyncHelper?.startBiConversation(receiverId: receiverId, senderId: senderId, then: {[weak self] convModel in
            DBHelper.shared.saveConversation(convModel)
            convsId = convModel.conversationId ?? 0
            self?.assembleConversationList()
            self?.view?.didCreateConversation()
        })
    }
    
    func getConversationsData(at indexPath: IndexPath) -> ConversationModel? {
        return conversationsList?[indexPath.row]
    }
    
//    func getConversationTitle(at indexPath: IndexPath) -> String? {
//        return conversationsList?[indexPath.row].messages?.last?.text
//    }
    
    func returnConversationsCount() -> Int {
        return conversationsList?.count ?? 0
    }

}

extension ConversationListPresenter: SubscribtionResultHandlerDelegate {
    
    func didReceiveConversations() {
        assembleConversationList()
    }
    
    func didReceiveMessagesFromUserMessagesQuery() {
        assembleConversationList()
    }
    
    func didReceiveMessageResult(messageModel: SubscribeByUserIdSubscription.Data.SubscribeByUserId.Message, mType: MsgType) {
        assembleConversationList()
    }
    
    func didRecieveSeenTrigger(seenModel: SubscribeByUserIdSubscription.Data.SubscribeByUserId.Seen) {
        
    }
    
    func didRecieveTypingTrigger(typingModel: SubscribeByUserIdSubscription.Data.SubscribeByUserId.Typing) {
        
    }
    
}
