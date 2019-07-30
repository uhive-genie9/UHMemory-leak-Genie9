//
//  MessageModel.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 4/2/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import MessageKit
import Kingfisher

enum MessageStatus: Int, Codable {
    case sent = 0
    case seen = 2
}

class MessageModel: MessageType, Codable, Cacheable {
    static let databaseTableName = TableName.message.rawValue

    var localId: Int?
    var msgId: Int?
    var conversationId: Int?
    var userId: Int?
    
    var text: String?
    var messageType: MsgType?
    var status: MessageStatus?
    var timeStamp: Int?
    
    var url: String?
    var urlDomain: String?
    var urlText: String?
    var urlTitle: String?
    var urlThumbURL: String?

    var displayName: String?
    var seen: Bool?
    
    var link: LinkModel? {
        return LinkModel(url: urlDomain, title: url, description: urlTitle, thumbnail: urlThumbURL)
    }
    
    var sender: SenderType {
        return Sender(id: "\(userId ?? 0)", displayName: displayName ?? "")
    }
    
    var messageId: String {
        return "\(msgId ?? 0)"
    }
    
    var sentDate: Date {
        return Date()
    }
    
    var kind: MessageKind {
        switch messageType {
        case .text?:
            return .text(text ?? "")
        case .video?:
            break
        case .image?:
            return .photo(MediaModel(url: URL(string: url ?? ""), image: nil, placeholderImage: #imageLiteral(resourceName: "customer"), size: CGSize(width: 255, height: 255)))
        case .document?:
            break
        case .link?:
            return .custom(link)
        case .youtube?:
            break
        case .location?:
            break
        case .gif?:
            break
        case .gifTenor?:
            break
        case .audio?:
            break
        case .none:
            break
    
        }
        return .text(text ?? "")
    }

    init(status: MessageStatus? = .none, msgId: Int? = nil, localId: Int? = nil, userId: Int, conversationId: Int, displayName: String, mType: MsgType, text: String? = nil, url: String? = nil, link: LinkModel? = nil, timestamp: Int) {
        self.status = status
        self.userId = userId
        self.displayName = displayName
        self.messageType = mType
        self.url = url
        self.msgId = msgId
        self.localId = localId
        self.text = text
        self.urlText = link?.title
        self.urlTitle = link?.description
        self.urlDomain = link?.url
        self.urlThumbURL = link?.thumbnail
        self.timeStamp = timestamp
        self.conversationId = conversationId
    }
    
    enum CodingKeys: String, CodingKey  {
        case conversationId = "conversation_id",
        userId = "user_id", msgId = "message_id",
        timeStamp = "timestamp", text = "text",
        messageType = "m_type", url = "url", status,
        urlDomain = "url_domain", urlThumbURL = "url_thumb_url",
        urlText = "url_text", urlTitle = "url_title", localId = "local_id"
    }
}
