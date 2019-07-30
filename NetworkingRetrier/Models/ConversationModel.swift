//
//  ConversationModel.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 5/26/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation

class UserConversationsModel: Cacheable , Configurable{
    
    var userConversations: [ConversationModel]?
    var nextToken: String?
    
    init(userConversations: [ConversationModel]? , nextToken: String?) {
        self.userConversations = userConversations
        self.nextToken = nextToken
    }
    
    enum CodingKeys: String, CodingKey {
        case userConversations = "conversations"
        case nextToken = "next_token"
    }
    
}

class ConversationModel: Cacheable , Configurable {
    static let databaseTableName = TableName.conversation.rawValue
    var conversationId: Int?
    var lastAction: Int?
    var lastActionId: String?
    var timestamp: Int?
    var unseenCount: Int?
    var peerUser: PeerUser?
    var message: MessageUser?
    
    init(conversationId: Int?,lastAction: Int?, lastActionId: String? ,timestamp: Int?,unseenCount: Int?,  peerUser :PeerUser? ,message: MessageUser?) {
        self.conversationId = conversationId
        self.lastAction = lastAction
        self.lastActionId = lastActionId
        self.timestamp = timestamp
        self.unseenCount = unseenCount
        self.peerUser = peerUser
        self.message = message
    }
    
    enum CodingKeys: String, CodingKey {
        case conversationId = "conversation_id"
        case lastAction = "last_action"
        case lastActionId = "last_action_id"
        case unseenCount = "unseen_count"
        case peerUser = "peer_user"
        case timestamp, message
    }
}

class PeerUser: Cacheable , Configurable{
    
    var userId: Int?
    var name: String?
    
    init(name: String?, userId: Int?){
        self.name = name
        self.userId = userId
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name
    }
    
}

class MessageUser: Cacheable , Configurable {
  var convType: Int?
  var conversationId: Int?
  var localId: Int?
  var mType: Int?
  var messageId: Int?
  var status: Int?
  var text: String?
  var timestamp: Int?
  var url: String?
  var userId: Int?
    
    init(convType: Int?,conversationId: Int?, localId: Int? ,mType: Int?,messageId: Int?, status: Int? , text :String? ,timestamp: Int?, url: String?,userId: Int?) {
        self.convType = convType
        self.conversationId = conversationId
        self.localId = localId
        self.mType = mType
        self.messageId = messageId
        self.status = status
        self.text = text
        self.timestamp = timestamp
        self.url = url
        self.userId = userId
    }
    
    
    enum CodingKeys: String, CodingKey {
        case convType = "conv_type"
        case conversationId = "conversation_id"
        case localId = "local_id"
        case mType = "m_type"
        case messageId = "message_id"
        case userId = "user_id"
        case status , text ,timestamp, url
    
    }
    
}
