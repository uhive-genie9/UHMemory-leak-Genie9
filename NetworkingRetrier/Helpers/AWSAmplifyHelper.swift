//
//  AWSAmplifyHelper.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 3/28/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import AWSAppSync
import AWSCore
typealias Handler<T> = (Result<T>, String?) -> Void

//MARK: - ERROR, RESULT, CONNECTION HANDLING DELEGATES
protocol SubscribtionResultHandlerDelegate: class {
    func didReceiveMessagesFromUserMessagesQuery()// called on each iteration of getUserMessages..
    func didReceiveMessageResult(messageModel :SubscribeByUserIdSubscription.Data.SubscribeByUserId.Message, mType: MsgType)
    func didRecieveSeenTrigger(seenModel: SubscribeByUserIdSubscription.Data.SubscribeByUserId.Seen)
    func didRecieveTypingTrigger(typingModel: SubscribeByUserIdSubscription.Data.SubscribeByUserId.Typing)
//  func didRecieveDeliveredTrigger(deliveredModel: SubscribeByUserIdSubscription.Data.SubscribeByUserId.Delivered)
    func didReceiveConversations()
}

protocol SubscribtionErrorHandlerDelegate: class {
    func doUnauthorized()
    func doSubscriptionTerminated()
    func doGeneralError()
}

extension AWSAmplifyHelper: SubscribtionErrorHandlerDelegate {
    
    func doUnauthorized() {
        userService.refreshUserToken(refreshToken: senderRefreshToken) {
            print("user authorized")
            self.startUserSubscription(senderId: senderId, completion: nil)
        }
    }
    
    func doSubscriptionTerminated() {
        startUserSubscription(senderId: senderId, completion: nil)
    }
    
    func doGeneralError() {
        print("general error")
    }
    
}

class AWSAmplifyHelper {
    var userService = UserService()
    var errorHandling: AppSyncErrorHandler?
    init() {
        errorHandling = AppSyncErrorHandler(delegate: self)
    }
    //MARK: - PRIVATE VARIABLES
    weak var subscribtionResultHandlingDelegate: SubscribtionResultHandlerDelegate?
    weak var connectionStateChangeHandlerDelegate: ConnectionStateChangeHandlerDelegate?
    private var isNetworkAvailable: Bool = true
    var appSyncClient: AWSAppSyncClient?//maybe
    private var cancellable: Cancellable?//maybe
    //trying new approach instead of cancellable, watcher is cancellable.
    var newMessagesSubscriptionWatcher: AWSAppSyncSubscriptionWatcher<SubscribeByUserIdSubscription>?
    
    
    
    
    private var userPoolAuthProviderHelper: UserPoolAuthProviderHelper?//maybe
    
    //MARK: - AMPLIFY CONFIGURATION
    
    func createCacheFile() -> URL? {
        guard let url = try? FileManager.default.url(for: .documentDirectory,
                                                     in: .userDomainMask,
                                                     appropriateFor: nil,
                                                     create: false) else {return nil}
        
        return url.appendingPathComponent("Chat101Database")
    }
 
    func configureAmplify(completion: @escaping () -> Void) {
        
        do {
            
            // You can choose the directory in which AppSync stores its persistent cache databases:
            //     let cacheConfiguration = AWSAppSyncCacheConfiguration(withRootDirectory: rootDirectoryURL)
            // or use the default configuration to store the databases in the app's Cache directory:
            //     let cacheConfiguration = AWSAppSyncCacheConfiguration()
            // or use in-memory (rather than persistent) caching by not specifying a cache configuration:
            //     let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncServiceConfig: AWSAppSyncServiceConfig())
            // or even specify individual caches. Passing `nil` to any of these will cause it to be in-memory:
            //     let cacheConfiguration= AWSAppSyncCacheConfiguration(
            //         // or nil to use in-memory cache
            //         offlineMutations: pathToOfflineMutationDB,
            //         queries: pathToQueriesDB,
            //         subscriptionMetadataCache: pathToSubscriptionMetadataDB)
            let cacheConfiguration = try AWSAppSyncCacheConfiguration(withRootDirectory: createCacheFile())
            
            // AppSync configuration & client initialization
            let appSyncServiceConfig = try AWSAppSyncServiceConfig()
            let authProvider = UserPoolAuthProviderHelper()
            let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncServiceConfig: appSyncServiceConfig,
                                                                  userPoolsAuthProvider: authProvider,
                                                                  cacheConfiguration: cacheConfiguration,
                                                                  connectionStateChangeHandler: ConnectionStateHelper(delegate: self))
            
            
            appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
            
            // Set id as the cache key for objects. See architecture section for details
            appSyncClient?.apolloClient?.cacheKeyForObject = { $0["id"] }
            
            completion()
        } catch AWSAppSyncClientError.requestFailed(_, _, _){
            print("requestFailed")
        } catch AWSAppSyncClientError.authenticationError(_) {
            print("authenticationError")
        } catch AWSAppSyncClientError.noData(_) {
            print("noData")
        } catch AWSAppSyncClientError.parseError(_, _, _) {
            print("parseError")
        } catch let error {
            print("general error: \(error)")
        }
        
    }
    
    //MARK: - QUERIES
    
    func getUserMessages(userId: Int, fetchCount: Int, from lastMessageID: Int? = nil) {
//        let queue = DispatchQueue(label: "CHAT101-GetUserMessages Queue", qos: .background, attributes: [.concurrent], autoreleaseFrequency: .inherit)
//
//        let query = GetUserMessagesQuery.init(user_id: userId, fetch_count: fetchCount, start_from: lastMessageID)
//        appSyncClient?.fetch(query: query, cachePolicy: .fetchIgnoringCacheData, queue: queue, resultHandler: { [weak self](result, error) in
//
//            if !(result?.errors?.isEmpty ?? true) {
//                print(result?.errors! as Any)
//                return
//            }
//            do {
//                guard let jsonObject = result?.data?.jsonObject else {return} //serialization and mirror coding keys
//
//                var messagesJSONArray = jsonObject.map{$0.value}
//
//                let jsonData = try JSONSerialization.data(withJSONObject: messagesJSONArray[0], options: .prettyPrinted)
//                let userMessages = try JSONDecoder().decode([MessageModel].self, from: jsonData)
//
//                print("Received \(userMessages.count) user messages")
//                DBHelper.shared.saveMessages(userMessages)
//                DispatchQueue.main.async {
//                    self?.subscribtionResultHandlingDelegate?.didReceiveMessagesFromUserMessagesQuery()
//                }
//                if (userMessages.isEmpty) {
//                    return
//                }
//                let latestMessageInDB = DBHelper.shared.getLatestMessage()
//                let messageID = latestMessageInDB?.messageId
//                self?.getUserMessages(userId: userId, fetchCount: fetchCount, from: Int(messageID ?? ""))
//
//
//            } catch {
//                print(error)
//            }
//
//        })
    }
    
    func getConversations(baseConv: Int? = nil, fetchCount: Int? = nil, nextToken: String? = nil, userId: Int ,completion: @escaping Handler<[ConversationModel]>){
        let query = GetUserConversationsV3Query( fetch_count: fetchCount, next_token: nextToken, user_id: userId)
        appSyncClient?.fetch(query: query, cachePolicy: .fetchIgnoringCacheData, resultHandler: { (result, errer) in
            if let errer = errer{
                completion(.failure(errer), nil)
            }
            guard let result = result?.data else {
                completion(.failure(errer!), nil)
                return
            }
            do {
                guard let jsonObject = result.getUserConversationsV3?.jsonObject else {
                    completion(.failure(errer!), nil)
                    return
                }
                let jsonData = try JSONSerialization.data(withJSONObject: jsonObject["conversations"] , options: .prettyPrinted)
                let userConversations = try JSONDecoder().decode([ConversationModel].self, from: jsonData)
                let nextToken = result.getUserConversationsV3?.nextToken ?? nil
                if let isEmpty = DBHelper.shared.isEmptyConversations() ,isEmpty {
                    DBHelper.shared.saveConversations(userConversations)
                    UserDefault.Shared.setNextToken(nextToken)
                }
                completion(.success(userConversations),nextToken)
            } catch {
                completion(.failure(errer!), nil)
            }
        })
    }
    /// getting the conversations
    ///
    /// - Parameters:
    ///   - user_id: userId
    ///   - fetchCount: conversations count on each hit
    ///   - lastMessageId: last message id
    ///   - completion: on completion
    func getConversations(user_id: Int, fetchCount: Int, lastMessageId: Int? = nil) {
//        DBHelper.shared.deleteConversations()
//        let query = GetUserConversationsQuery(user_id: user_id, fetch_count: fetchCount, start_from: lastMessageId)
//
//        appSyncClient?.fetch(query: query, cachePolicy: .fetchIgnoringCacheData, resultHandler: {(queryResult, error) in
//            if !(queryResult?.errors?.isEmpty ?? true) {
//                print(queryResult?.errors! as Any)
//                return
//            }
//
//            do {
//                guard let jsonObject = queryResult?.data?.jsonObject else {return} //serialization and mirror coding keys
//
//                var conversationsJSONArray = jsonObject.map{$0.value}
//
//                let jsonData = try JSONSerialization.data(withJSONObject: conversationsJSONArray[0], options: .prettyPrinted)
//                let userConversations = try JSONDecoder().decode([ConversationModel].self, from: jsonData)
//
//                print("Received \(userConversations.count) user conversations")
//                DBHelper.shared.saveConversations(userConversations)
//                DispatchQueue.main.async {
//                    self.subscribtionResultHandlingDelegate?.didReceiveConversations()
//                }
//                if (userConversations.isEmpty) {
//                    return
//                }
//                //                let latestMessageInDB = DBHelper.shared.getLatestMessageModelID()
//                //                let messageID = latestMessageInDB?.messageId
//                //                self?.getUserMessages(userId: userId, fetchCount: fetchCount, from: Int(messageID ?? ""))
//            } catch {
//                print(error)
//            }
//        })
    }
    
    /// getting the conversation messages
    ///
    /// - Parameters:
    ///   - conversatoinId: conversatoin id
    ///   - fetchCount: messeges fetched count
    ///   - completion: completion whether fails or succeeds
    func getConversatoinMessages(senderId: Int, conversatoinId: Int, fetchCount: Int, lastMessageId: Int? = nil, completion: @escaping ((Result<GraphQLResult<GetConversationMessagesQuery.Data>?>) -> Void)) {
//        let query = GetConversationMessagesQuery(user_id: senderId, conversation_id: conversatoinId, fetch_count: fetchCount, start_from: lastMessageId)
//        appSyncClient?.fetch(query: query, cachePolicy: isNetworkAvailable ? .fetchIgnoringCacheData: .fetchIgnoringCacheData, resultHandler: { (queryResult, error) in
//
//            guard let error = queryResult?.errors else {
//                completion(.success(queryResult))
//                return
//            }
//            //            if let error = queryResult?.errors?.first as? NSError {
//            //                print("Error starting subscription. \(error)")
//            //                self.errorHandling?.handleAppSyncErrors(for: AppSyncErrors(rawValue: error.code) ?? .generalError)
//            //                print(error)
//            //            }
//            completion(.failure(error.first!))
//        })
        
    }
    
    
    /// getOnlineStatus
    ///
    /// - Parameters:
    ///   - userId: userId
    ///   - completion: completion(returns online status and time stamp)
    func getOnlineStatus(userId: Int, completion: @escaping ((String, Bool) -> Void)) {
        let query = GetUserOnlineStatusQuery(user_id: userId)
        appSyncClient?.fetch(query: query, cachePolicy: .fetchIgnoringCacheData ,resultHandler: { (result, error) in
            guard let lastSeen = result?.data?.getUserOnlineStatus?.lastSeen, let isOnline = result?.data?.getUserOnlineStatus?.isOnline else {return}
            completion(lastSeen, isOnline)
        })
    }
    
    
    //MARK: - MUTATIONS
    
    /// typingMutation
    ///
    /// - Parameters:
    ///   - receiverId: receiverId
    ///   - conversatoinId: conversatoinId
    ///   - senderId: senderId
    ///   - action: on/off (user is typing)
    func typingMutation(receiverId: Int, conversatoinId: Int,
                        senderId: Int, action: TypingAction) {
        
//        let mutation = PublishTypingMutation(receiver_id: receiverId, conversation_id: conversatoinId, user_id: senderId, action: action.rawValue)
//        appSyncClient?.perform(mutation: mutation, resultHandler: { (graphQLResult, error) in
//            guard let _ = graphQLResult else {
//                guard let error = error else {return}
//                print(error); return}
//        })
    }
    
    
    
    
    
    /// send message mutation main Function
    
    ///
    /// - Parameters:
    ///   - queue: the queue on which the mutation runs on
    ///   - optimisticUpdate:
    ///   - receiverId: the receiver's id
    ///   - conversationId: the conversation's id
    ///   - messageType: message type as enum
    ///   - text: text
    ///   - url: url
    ///   - senderId: the sender's id
    ///   - completion: the success or the fail of the mutation
    private func addMessageMutation(queue: DispatchQueue = .main, optimisticUpdate: OptimisticResponseBlock? = nil, localId: Int ,receiverId: Int, conversationId: Int, messageType: MsgType = .text, linkPreview: LinkModel? = nil, text: String? = nil, url: String? = nil, senderId: Int, completion: @escaping ((Result<GraphQLResult<AddMessageMutation.Data>?>, Int?) -> Void)) {
        
//        let mutation = AddMessageMutation(receiver_id: receiverId, user_id: senderId, conversation_id: conversationId, local_id: localId, m_type: messageType.rawValue, text: text, url: messageType == .image ? url : linkPreview?.url, url_title: linkPreview?.description, url_thumb_url: linkPreview?.thumbnail ?? "", url_domain:linkPreview?.url ?? "")
//
//        appSyncClient?.perform(mutation: mutation, resultHandler: { (result, error) in
//            guard let result = result else {
//                guard let error = error else {return}
//
//                completion(.failure(error), nil)
//                return}
//
//            completion(.success(result), result.data?.addMessage?.message?.messageId)
//        })
//
//
    }
    
    /// send image message mutation
    ///
    /// - Parameters:
    ///   - receiverId: the receiver's id
    ///   - convoId: the conversation's id
    ///   - senderId: the sender's id
    ///   - imageUrl: image url
    func sendImageMessageMutation(receiverId: Int, localId: Int, convoId: Int, senderId: Int, url: String?, completion: @escaping (Int?) -> Void) {
        
        self.addMessageMutation(localId: localId, receiverId: receiverId, conversationId: convoId, messageType: .image, text: "", url: url, senderId: senderId, completion: { (result,msgId)  in
            switch result {
                
            case .success( _):
                completion(msgId)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        })
    }
    
    
    /// Send message mutation
    ///
    /// - Parameters:
    ///   - receiverId: the receive's id
    ///   - senderId: the sender's id
    ///   - conversationId: the conversation id
    ///   - text: the actual text
    ///   - url: the url if found
    func sendTextMessageMutation(receiverId: Int, senderId: Int, localId: Double, conversationId: Int, text: String, completion: @escaping(Int?) -> Void) {
        let localIDInt = Int(localId)
        self.addMessageMutation(localId: localIDInt, receiverId: receiverId, conversationId: conversationId, text: text, senderId: senderId) { (result,msgId)  in
            switch result {
            case .success( _):
                completion(msgId)
            case .failure(let error):
                print(error)
                completion(nil)
                
            }
        }
    }
    
    
    /// send link preview mutation
    ///
    /// - Parameters:
    ///   - receiverId: receiverId
    ///   - senderId: senderId
    ///   - conversationId: conversationId
    ///   - text: text
    ///   - linkPreview: linkPreview
    ///   - completion: completion
    func sendLinkPreviewMutation(receiverId: Int, senderId: Int, localId: Int, conversationId: Int, text: String? = nil, linkPreview: LinkModel, completion: @escaping(Int?) -> Void) {
        self.addMessageMutation(localId: localId, receiverId: receiverId, conversationId: conversationId, messageType: .link, linkPreview: linkPreview, text: text, senderId: senderId) { (result, messageId) in
            switch result {
            case .success(_):
                completion(messageId)
            case .failure(let error):
                print(error)
                completion(nil)
                
            }
        }
    }
    
    
    /// set message as seen
    /// this method is called whenever the user recieves a message (if the user recieves a subscription handler with action seen)
    /// and based on the seen object, set two blue ticks to mark as seen.
    /// - Parameters:
    ///   - receiverId: the receiver's id
    ///   - conversationId: the conversation id
    ///   - lastMessageSeenId: last message seen id
    func setMessageSeenMutation(receiverId: Int, conversationId: Int, lastMessageSeenId: Int) {
//        let mutation = SetSeenConversationMutation(receiver_id: receiverId, conversation_id: conversationId, last_msg_seen_id: lastMessageSeenId)
//
//        appSyncClient?.perform(mutation: mutation, resultHandler: { (_, _) in })
    }
 
    /// changes the sender's online status to either offline or online based on a boolean value asigned to isOnline param.
    ///
    /// - Parameters:
    ///   - senderId: sender's id
    ///   - isOnline: boolean value which indicates the status of the user(true: online, false: offline)
    func changeOnlineStatus(senderId: Int, isOnline: Bool) {
//        let mutation = ChangeOnlineStatusMutation(user_id: senderId, is_online: isOnline)
//
//        appSyncClient?.perform(mutation: mutation, resultHandler: {(_, _) in})
    }
    
    
    func startBiConversation(receiverId: Int, senderId: Int, then completion: @escaping(ConversationModel) -> Void) {
//        let mutation = StartConversationMutation(sender_id: senderId, receiver_id: receiverId)
//        appSyncClient?.perform(mutation: mutation, resultHandler: { (result, error) in
//
//            do {
//                guard let jsonObject = result?.data?.startConversation?.conversation?.jsonObject else {return} //serialization and mirror coding keys
//
//                let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
//                let userConversation = try JSONDecoder().decode(ConversationModel.self, from: jsonData)
//
//                completion(userConversation)
//            } catch {
//                print(error)
//            }
//
//        })
    }
    
    
    //MARK: - Subscriptions
    
    func startUserSubscription(senderId: Int, completion: (() -> Void)? = nil) {
        
        let userSubscribtion = SubscribeByUserIdSubscription(receiver_id: senderId)
        
        do {
            //the following statement is assigned to a cancellabe variable, cancellable = try appSyncCleint.., etc.
            newMessagesSubscriptionWatcher = try appSyncClient?.subscribe(subscription: userSubscribtion, statusChangeHandler: {[weak self] status in
                self?.handleSubscriptionStatus(status, senderId: senderId)
            }, resultHandler: {[weak self](result, _, error) in
                self?.handleResult(result, error)
                completion?()
            })
            
        } catch let error as NSError {
            print("Error starting subscription. \(error)")
            errorHandling?.handleAppSyncErrors(for: AppSyncErrors(rawValue: error.code) ?? .generalError)
        }
        
    }
    
    func stopUserSubscription() {
        //        cancellable?.cancel()
        newMessagesSubscriptionWatcher?.cancel()
    }
    
    private func handleSubscriptionStatus(_ status: AWSAppSyncSubscriptionWatcherStatus, senderId: Int) {
        switch status {
        case .disconnected:
            print("Subscribe - disconnected")
        case .error(.connectionError):
            print("Subscribe - connectionError")
        case .connected:
            print("Subscribe - connected")
        case .connecting:
            print("Subscribe - connecting")
        case .error(.connectionRefused):
            print("Subscribe - connectionRefused")
        case .error(.disconnected):
            print("Subscribe - disconnected")
        case .error(.messageCallbackError(_)):
            print("Subscribe - messageCallbackError")
        case .error(.other(_)):
            print("Subscribe - other")
        case .error(.parseError(_)):
            print("Subscribe - parseError")
        case .error(.protocolError):
            print("Subscribe - protocolError")
        case .error(.setupError(_)):
            print("Subscribe - setupError ")
        case .error(.unknownMQTTConnectionStatus):
            print("Subscribe - unknownMQTTConnectionStatus")
        }
    }
    
    private func handleResult(_ result: GraphQLResult<SubscribeByUserIdSubscription.Data>?, _ error: Error?) {
        
        guard let result = result, error == nil else {
            if let error = error as NSError? {
                print(error.localizedDescription)
                errorHandling?.handleAppSyncErrors(for: AppSyncErrors(rawValue: error.code) ?? .generalError)
            }
            return
        }
        guard let actionType = MessageActionTypes(rawValue: result.data?.subscribeByUserId?.actionType ?? 0) else {return}
        handleMessageActionType(actionType, result)
    }
    
    private func handleMessageActionType(_ actionType: MessageActionTypes, _ result: GraphQLResult<SubscribeByUserIdSubscription.Data>) {
        
        switch actionType {
            
        case .newMessage:
            handleNewMessageType(result)
        case .typing:
            guard let typing = result.data?.subscribeByUserId?.typing else {return}
            subscribtionResultHandlingDelegate?.didRecieveTypingTrigger(typingModel: typing)
            
        case .seen:
            guard let seen = result.data?.subscribeByUserId?.seen, let message = DBHelper.shared.getLatestMessage() else {return}
            message.status = .seen
            DBHelper.shared.save(message)
            subscribtionResultHandlingDelegate?.didRecieveSeenTrigger(seenModel: seen)
        case .joinedForGroupConversation:
            break
        }
    }
    
    
    private func handleNewMessageType(_ result: GraphQLResult<SubscribeByUserIdSubscription.Data>?) {
        let timeStamp = (Date().timeIntervalSince1970)
        
        guard let message = result?.data?.subscribeByUserId?.message, let msgType = MsgType(rawValue: message.mType) else {return}
        
        switch msgType {
        case .text:
            
            let incomingTextMessage = MessageModel(status: .sent, msgId: message.messageId, userId: message.userId, conversationId: message.conversationId, displayName: "\(message.userId)", mType: .text, text: message.text, timestamp: Int(timeStamp))
            DBHelper.shared.saveMessage(incomingTextMessage)
            
            subscribtionResultHandlingDelegate?.didReceiveMessageResult(messageModel: message, mType: .text)
        case .image:
            let incomingImageMessage = MessageModel(status: .sent, msgId: message.messageId, userId:  message.userId, conversationId: message.conversationId, displayName: "\(message.userId)", mType: .image, url: message.url ?? "", timestamp: Int(Date().timeIntervalSince1970))
            DBHelper.shared.saveMessage(incomingImageMessage)
            subscribtionResultHandlingDelegate?.didReceiveMessageResult(messageModel: message, mType: .image)
        case .video:
            subscribtionResultHandlingDelegate?.didReceiveMessageResult(messageModel: message, mType: .video)
        case .document:
            subscribtionResultHandlingDelegate?.didReceiveMessageResult(messageModel: message, mType: .document)
        case .link:
            subscribtionResultHandlingDelegate?.didReceiveMessageResult(messageModel: message, mType: .link)
        case .youtube:
            break
        case .location:
            subscribtionResultHandlingDelegate?.didReceiveMessageResult(messageModel: message, mType: .location)
        case .gif:
            break
        case .gifTenor:
            break
        case .audio:
            break
       
        }
    }
    
}

//MARK: - HANDLING TIME-OUT INTERVAL

extension URLSessionConfiguration {
    
    /// A `URLSessionConfiguration` to have a request timeout of 1 minutes.
    static let customDelayed: URLSessionConfiguration = {
        let secondsInOneMinute = 60
        let numberOfMinutesForTimeout = 1
        let timoutInterval = TimeInterval(numberOfMinutesForTimeout * secondsInOneMinute)
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timoutInterval
        configuration.timeoutIntervalForResource = timoutInterval
        return configuration
    }()
}

extension AWSAmplifyHelper: ConnectionStateChangeHandlerDelegate {
    func connectionDidBecomeOnline() {
        isNetworkAvailable = true
        connectionStateChangeHandlerDelegate?.connectionDidBecomeOnline()
    }
    
    func connectionDidBecomeOffline() {
        isNetworkAvailable = false
        connectionStateChangeHandlerDelegate?.connectionDidBecomeOffline()
    }
}

// MARK: - MUTATIONS
enum TypingAction: Int {
    case on = 0
    case off = 1
}
