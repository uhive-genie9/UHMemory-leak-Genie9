//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct MessageInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(conversationId: Int? = nil, localId: Int, mType: Int, receiverId: Int? = nil, text: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
    graphQLMap = ["conversation_id": conversationId, "local_id": localId, "m_type": mType, "receiver_id": receiverId, "text": text, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId]
  }

  /// n/a , is optional in case of when you startConversation with a message
  public var conversationId: Int? {
    get {
      return graphQLMap["conversation_id"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "conversation_id")
    }
  }

  /// Message id in client's local database
  public var localId: Int {
    get {
      return graphQLMap["local_id"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "local_id")
    }
  }

  /// Message type Enum values : <br>
  /// ################################# 0 : TEXT <br>
  /// ################################# 1 : VIDEO <br>
  /// ################################# 2 : PICTURE <br>
  /// ################################# 3 : DOCUMENT <br>
  /// ################################# 4 : LINK <br>
  /// ################################# 5 : LINK_YOUTUBE <br>
  /// ################################# 6 : GIF <br>
  /// ################################# 7 : GIF_TENOR <br>
  /// ################################# 8 : AUDIO <br>
  /// ################################# 9 : LOCATION
  public var mType: Int {
    get {
      return graphQLMap["m_type"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "m_type")
    }
  }

  /// ID of the other party of the convesration; that will receive this action on subscription
  public var receiverId: Int? {
    get {
      return graphQLMap["receiver_id"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "receiver_id")
    }
  }

  /// Message text
  public var text: String? {
    get {
      return graphQLMap["text"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "text")
    }
  }

  /// URL of the attachment, link, gif
  public var url: String? {
    get {
      return graphQLMap["url"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "url")
    }
  }

  /// URL preview domain
  public var urlDomain: String? {
    get {
      return graphQLMap["url_domain"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "url_domain")
    }
  }

  /// URL preview text
  public var urlText: String? {
    get {
      return graphQLMap["url_text"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "url_text")
    }
  }

  /// URL preview thumb
  public var thumbUrl: String? {
    get {
      return graphQLMap["thumb_url"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "thumb_url")
    }
  }

  /// URL preview Title
  public var urlTitle: String? {
    get {
      return graphQLMap["url_title"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "url_title")
    }
  }

  /// User ID of the sender
  public var userId: Int {
    get {
      return graphQLMap["user_id"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_id")
    }
  }
}

public struct GroupMemberInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: Int) {
    graphQLMap = ["id": id]
  }

  public var id: Int {
    get {
      return graphQLMap["id"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public final class DeleteConversationsMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteConversations($user_id: Int!, $conversations_ids: [Int!]) {\n  deleteConversations(user_id: $user_id, conversations_ids: $conversations_ids)\n}"

  public var user_id: Int
  public var conversations_ids: [Int]?

  public init(user_id: Int, conversations_ids: [Int]?) {
    self.user_id = user_id
    self.conversations_ids = conversations_ids
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id, "conversations_ids": conversations_ids]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteConversations", arguments: ["user_id": GraphQLVariable("user_id"), "conversations_ids": GraphQLVariable("conversations_ids")], type: .scalar(Bool.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteConversations: Bool? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteConversations": deleteConversations])
    }

    /// Deleting the conversation will not remove it from the database, it will only set a timestamp of the deletion time <br>
    /// # which will not allow the user to fetch messages before it. <br>
    /// # When a conversation is deleted it will not be listed in user's conversations until a new action(like a new message) is emerged
    public var deleteConversations: Bool? {
      get {
        return snapshot["deleteConversations"] as? Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "deleteConversations")
      }
    }
  }
}

public final class AddMessageMutation: GraphQLMutation {
  public static let operationString =
    "mutation AddMessage($conversation_id: Int!, $local_id: Int!, $m_type: Int!, $receiver_id: Int, $text: String, $url: String, $url_domain: String, $url_text: String, $thumb_url: String, $url_title: String, $user_id: Int!) {\n  addMessage(conversation_id: $conversation_id, local_id: $local_id, m_type: $m_type, receiver_id: $receiver_id, text: $text, url: $url, url_domain: $url_domain, url_text: $url_text, thumb_url: $thumb_url, url_title: $url_title, user_id: $user_id) {\n    __typename\n    action_type\n    conversation {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    receiver_id\n    seen {\n      __typename\n      conversation_id\n      last_msg_seen_id\n    }\n    typing {\n      __typename\n      action\n      conversation_id\n      conversation_type\n      receiver_id\n      user_id\n    }\n  }\n}"

  public var conversation_id: Int
  public var local_id: Int
  public var m_type: Int
  public var receiver_id: Int?
  public var text: String?
  public var url: String?
  public var url_domain: String?
  public var url_text: String?
  public var thumb_url: String?
  public var url_title: String?
  public var user_id: Int

  public init(conversation_id: Int, local_id: Int, m_type: Int, receiver_id: Int? = nil, text: String? = nil, url: String? = nil, url_domain: String? = nil, url_text: String? = nil, thumb_url: String? = nil, url_title: String? = nil, user_id: Int) {
    self.conversation_id = conversation_id
    self.local_id = local_id
    self.m_type = m_type
    self.receiver_id = receiver_id
    self.text = text
    self.url = url
    self.url_domain = url_domain
    self.url_text = url_text
    self.thumb_url = thumb_url
    self.url_title = url_title
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["conversation_id": conversation_id, "local_id": local_id, "m_type": m_type, "receiver_id": receiver_id, "text": text, "url": url, "url_domain": url_domain, "url_text": url_text, "thumb_url": thumb_url, "url_title": url_title, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addMessage", arguments: ["conversation_id": GraphQLVariable("conversation_id"), "local_id": GraphQLVariable("local_id"), "m_type": GraphQLVariable("m_type"), "receiver_id": GraphQLVariable("receiver_id"), "text": GraphQLVariable("text"), "url": GraphQLVariable("url"), "url_domain": GraphQLVariable("url_domain"), "url_text": GraphQLVariable("url_text"), "thumb_url": GraphQLVariable("thumb_url"), "url_title": GraphQLVariable("url_title"), "user_id": GraphQLVariable("user_id")], type: .object(AddMessage.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(addMessage: AddMessage? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "addMessage": addMessage.flatMap { $0.snapshot }])
    }

    /// Send message to a conversation, the "receiver_id"<Int> will determine which user will recieve this message
    public var addMessage: AddMessage? {
      get {
        return (snapshot["addMessage"] as? Snapshot).flatMap { AddMessage(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "addMessage")
      }
    }

    public struct AddMessage: GraphQLSelectionSet {
      public static let possibleTypes = ["UserIdGenericOutput"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action_type", type: .scalar(Int.self)),
        GraphQLField("conversation", type: .object(Conversation.selections)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("seen", type: .object(Seen.selections)),
        GraphQLField("typing", type: .object(Typing.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(actionType: Int? = nil, conversation: Conversation? = nil, message: Message? = nil, receiverId: Int? = nil, seen: Seen? = nil, typing: Typing? = nil) {
        self.init(snapshot: ["__typename": "UserIdGenericOutput", "action_type": actionType, "conversation": conversation.flatMap { $0.snapshot }, "message": message.flatMap { $0.snapshot }, "receiver_id": receiverId, "seen": seen.flatMap { $0.snapshot }, "typing": typing.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// action_type Enum values : <br>
      /// ################################# 0 : NEW_MESSAGE <br>
      /// ################################# 1 : TYPING <br>
      /// ################################# 2 : SEEN <br>
      /// ################################# 3 : NEW_CONVERSATION <br>
      /// ################################# 4 : JOINED_FOR_GROUP_CONVERSATION <br>
      public var actionType: Int? {
        get {
          return snapshot["action_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "action_type")
        }
      }

      /// New-Conversation in case of action_type = 3
      public var conversation: Conversation? {
        get {
          return (snapshot["conversation"] as? Snapshot).flatMap { Conversation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "conversation")
        }
      }

      /// Message body in case if action_type is 0
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The User ID that will receive this output through subscribeByUserID
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// Seen information in case of action_type = 2
      public var seen: Seen? {
        get {
          return (snapshot["seen"] as? Snapshot).flatMap { Seen(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "seen")
        }
      }

      /// Typing infromation in case if action_type is 1
      public var typing: Typing? {
        get {
          return (snapshot["typing"] as? Snapshot).flatMap { Typing(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "typing")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem_startConversation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem_startConversation", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be chaned on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct Seen: GraphQLSelectionSet {
        public static let possibleTypes = ["SeenOutput"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_msg_seen_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastMsgSeenId: Int) {
          self.init(snapshot: ["__typename": "SeenOutput", "conversation_id": conversationId, "last_msg_seen_id": lastMsgSeenId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The conversation which the other client marked as seen
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID of the last seen message on the other client
        public var lastMsgSeenId: Int {
          get {
            return snapshot["last_msg_seen_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_seen_id")
          }
        }
      }

      public struct Typing: GraphQLSelectionSet {
        public static let possibleTypes = ["TypingCommiter"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .nonNull(.scalar(Int.self))),
          GraphQLField("conversation_id", type: .scalar(Int.self)),
          GraphQLField("conversation_type", type: .scalar(String.self)),
          GraphQLField("receiver_id", type: .scalar(Int.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(action: Int, conversationId: Int? = nil, conversationType: String? = nil, receiverId: Int? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "TypingCommiter", "action": action, "conversation_id": conversationId, "conversation_type": conversationType, "receiver_id": receiverId, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Action Enum values : <br>
        /// ################################# 0 : START_TYPING <br>
        /// ################################# 1 : STOP_TYPING
        public var action: Int {
          get {
            return snapshot["action"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "action")
          }
        }

        /// Conversation ID that the typing happened within
        public var conversationId: Int? {
          get {
            return snapshot["conversation_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        public var conversationType: String? {
          get {
            return snapshot["conversation_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_type")
          }
        }

        public var receiverId: Int? {
          get {
            return snapshot["receiver_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "receiver_id")
          }
        }

        /// User ID that committed the typing action
        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class AddMessageV2Mutation: GraphQLMutation {
  public static let operationString =
    "mutation AddMessageV2($conv_type: Int!, $conversation_id: Int!, $local_id: Int!, $m_type: Int!, $receiver_id: Int, $text: String, $url: String, $url_domain: String, $url_text: String, $thumb_url: String, $url_title: String, $user_id: Int!) {\n  addMessage_v2(conv_type: $conv_type, conversation_id: $conversation_id, local_id: $local_id, m_type: $m_type, receiver_id: $receiver_id, text: $text, url: $url, url_domain: $url_domain, url_text: $url_text, thumb_url: $thumb_url, url_title: $url_title, user_id: $user_id) {\n    __typename\n    action_type\n    conversation {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    receiver_id\n    seen {\n      __typename\n      conversation_id\n      last_msg_seen_id\n    }\n    typing {\n      __typename\n      action\n      conversation_id\n      conversation_type\n      receiver_id\n      user_id\n    }\n  }\n}"

  public var conv_type: Int
  public var conversation_id: Int
  public var local_id: Int
  public var m_type: Int
  public var receiver_id: Int?
  public var text: String?
  public var url: String?
  public var url_domain: String?
  public var url_text: String?
  public var thumb_url: String?
  public var url_title: String?
  public var user_id: Int

  public init(conv_type: Int, conversation_id: Int, local_id: Int, m_type: Int, receiver_id: Int? = nil, text: String? = nil, url: String? = nil, url_domain: String? = nil, url_text: String? = nil, thumb_url: String? = nil, url_title: String? = nil, user_id: Int) {
    self.conv_type = conv_type
    self.conversation_id = conversation_id
    self.local_id = local_id
    self.m_type = m_type
    self.receiver_id = receiver_id
    self.text = text
    self.url = url
    self.url_domain = url_domain
    self.url_text = url_text
    self.thumb_url = thumb_url
    self.url_title = url_title
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["conv_type": conv_type, "conversation_id": conversation_id, "local_id": local_id, "m_type": m_type, "receiver_id": receiver_id, "text": text, "url": url, "url_domain": url_domain, "url_text": url_text, "thumb_url": thumb_url, "url_title": url_title, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addMessage_v2", arguments: ["conv_type": GraphQLVariable("conv_type"), "conversation_id": GraphQLVariable("conversation_id"), "local_id": GraphQLVariable("local_id"), "m_type": GraphQLVariable("m_type"), "receiver_id": GraphQLVariable("receiver_id"), "text": GraphQLVariable("text"), "url": GraphQLVariable("url"), "url_domain": GraphQLVariable("url_domain"), "url_text": GraphQLVariable("url_text"), "thumb_url": GraphQLVariable("thumb_url"), "url_title": GraphQLVariable("url_title"), "user_id": GraphQLVariable("user_id")], type: .object(AddMessageV2.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(addMessageV2: AddMessageV2? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "addMessage_v2": addMessageV2.flatMap { $0.snapshot }])
    }

    /// Send message to a conversation, the "receiver_id"<Int> will determine which user will recieve this message
    public var addMessageV2: AddMessageV2? {
      get {
        return (snapshot["addMessage_v2"] as? Snapshot).flatMap { AddMessageV2(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "addMessage_v2")
      }
    }

    public struct AddMessageV2: GraphQLSelectionSet {
      public static let possibleTypes = ["UserIdGenericOutput"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action_type", type: .scalar(Int.self)),
        GraphQLField("conversation", type: .object(Conversation.selections)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("seen", type: .object(Seen.selections)),
        GraphQLField("typing", type: .object(Typing.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(actionType: Int? = nil, conversation: Conversation? = nil, message: Message? = nil, receiverId: Int? = nil, seen: Seen? = nil, typing: Typing? = nil) {
        self.init(snapshot: ["__typename": "UserIdGenericOutput", "action_type": actionType, "conversation": conversation.flatMap { $0.snapshot }, "message": message.flatMap { $0.snapshot }, "receiver_id": receiverId, "seen": seen.flatMap { $0.snapshot }, "typing": typing.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// action_type Enum values : <br>
      /// ################################# 0 : NEW_MESSAGE <br>
      /// ################################# 1 : TYPING <br>
      /// ################################# 2 : SEEN <br>
      /// ################################# 3 : NEW_CONVERSATION <br>
      /// ################################# 4 : JOINED_FOR_GROUP_CONVERSATION <br>
      public var actionType: Int? {
        get {
          return snapshot["action_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "action_type")
        }
      }

      /// New-Conversation in case of action_type = 3
      public var conversation: Conversation? {
        get {
          return (snapshot["conversation"] as? Snapshot).flatMap { Conversation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "conversation")
        }
      }

      /// Message body in case if action_type is 0
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The User ID that will receive this output through subscribeByUserID
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// Seen information in case of action_type = 2
      public var seen: Seen? {
        get {
          return (snapshot["seen"] as? Snapshot).flatMap { Seen(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "seen")
        }
      }

      /// Typing infromation in case if action_type is 1
      public var typing: Typing? {
        get {
          return (snapshot["typing"] as? Snapshot).flatMap { Typing(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "typing")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem_startConversation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem_startConversation", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be chaned on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct Seen: GraphQLSelectionSet {
        public static let possibleTypes = ["SeenOutput"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_msg_seen_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastMsgSeenId: Int) {
          self.init(snapshot: ["__typename": "SeenOutput", "conversation_id": conversationId, "last_msg_seen_id": lastMsgSeenId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The conversation which the other client marked as seen
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID of the last seen message on the other client
        public var lastMsgSeenId: Int {
          get {
            return snapshot["last_msg_seen_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_seen_id")
          }
        }
      }

      public struct Typing: GraphQLSelectionSet {
        public static let possibleTypes = ["TypingCommiter"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .nonNull(.scalar(Int.self))),
          GraphQLField("conversation_id", type: .scalar(Int.self)),
          GraphQLField("conversation_type", type: .scalar(String.self)),
          GraphQLField("receiver_id", type: .scalar(Int.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(action: Int, conversationId: Int? = nil, conversationType: String? = nil, receiverId: Int? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "TypingCommiter", "action": action, "conversation_id": conversationId, "conversation_type": conversationType, "receiver_id": receiverId, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Action Enum values : <br>
        /// ################################# 0 : START_TYPING <br>
        /// ################################# 1 : STOP_TYPING
        public var action: Int {
          get {
            return snapshot["action"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "action")
          }
        }

        /// Conversation ID that the typing happened within
        public var conversationId: Int? {
          get {
            return snapshot["conversation_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        public var conversationType: String? {
          get {
            return snapshot["conversation_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_type")
          }
        }

        public var receiverId: Int? {
          get {
            return snapshot["receiver_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "receiver_id")
          }
        }

        /// User ID that committed the typing action
        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class AddMessageV3Mutation: GraphQLMutation {
  public static let operationString =
    "mutation AddMessageV3($message: MessageInput, $receiver_id: Int) {\n  addMessage_v3(message: $message, receiver_id: $receiver_id) {\n    __typename\n    action_type\n    conversation {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    receiver_id\n    seen {\n      __typename\n      conversation_id\n      last_msg_seen_id\n    }\n    typing {\n      __typename\n      action\n      conversation_id\n      conversation_type\n      receiver_id\n      user_id\n    }\n  }\n}"

  public var message: MessageInput?
  public var receiver_id: Int?

  public init(message: MessageInput? = nil, receiver_id: Int? = nil) {
    self.message = message
    self.receiver_id = receiver_id
  }

  public var variables: GraphQLMap? {
    return ["message": message, "receiver_id": receiver_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addMessage_v3", arguments: ["message": GraphQLVariable("message"), "receiver_id": GraphQLVariable("receiver_id")], type: .object(AddMessageV3.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(addMessageV3: AddMessageV3? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "addMessage_v3": addMessageV3.flatMap { $0.snapshot }])
    }

    /// Send message to a conversation, the "receiver_id"<Int> will determine which user will recieve this message
    public var addMessageV3: AddMessageV3? {
      get {
        return (snapshot["addMessage_v3"] as? Snapshot).flatMap { AddMessageV3(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "addMessage_v3")
      }
    }

    public struct AddMessageV3: GraphQLSelectionSet {
      public static let possibleTypes = ["UserIdGenericOutput"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action_type", type: .scalar(Int.self)),
        GraphQLField("conversation", type: .object(Conversation.selections)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("seen", type: .object(Seen.selections)),
        GraphQLField("typing", type: .object(Typing.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(actionType: Int? = nil, conversation: Conversation? = nil, message: Message? = nil, receiverId: Int? = nil, seen: Seen? = nil, typing: Typing? = nil) {
        self.init(snapshot: ["__typename": "UserIdGenericOutput", "action_type": actionType, "conversation": conversation.flatMap { $0.snapshot }, "message": message.flatMap { $0.snapshot }, "receiver_id": receiverId, "seen": seen.flatMap { $0.snapshot }, "typing": typing.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// action_type Enum values : <br>
      /// ################################# 0 : NEW_MESSAGE <br>
      /// ################################# 1 : TYPING <br>
      /// ################################# 2 : SEEN <br>
      /// ################################# 3 : NEW_CONVERSATION <br>
      /// ################################# 4 : JOINED_FOR_GROUP_CONVERSATION <br>
      public var actionType: Int? {
        get {
          return snapshot["action_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "action_type")
        }
      }

      /// New-Conversation in case of action_type = 3
      public var conversation: Conversation? {
        get {
          return (snapshot["conversation"] as? Snapshot).flatMap { Conversation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "conversation")
        }
      }

      /// Message body in case if action_type is 0
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The User ID that will receive this output through subscribeByUserID
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// Seen information in case of action_type = 2
      public var seen: Seen? {
        get {
          return (snapshot["seen"] as? Snapshot).flatMap { Seen(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "seen")
        }
      }

      /// Typing infromation in case if action_type is 1
      public var typing: Typing? {
        get {
          return (snapshot["typing"] as? Snapshot).flatMap { Typing(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "typing")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem_startConversation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem_startConversation", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be chaned on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct Seen: GraphQLSelectionSet {
        public static let possibleTypes = ["SeenOutput"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_msg_seen_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastMsgSeenId: Int) {
          self.init(snapshot: ["__typename": "SeenOutput", "conversation_id": conversationId, "last_msg_seen_id": lastMsgSeenId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The conversation which the other client marked as seen
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID of the last seen message on the other client
        public var lastMsgSeenId: Int {
          get {
            return snapshot["last_msg_seen_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_seen_id")
          }
        }
      }

      public struct Typing: GraphQLSelectionSet {
        public static let possibleTypes = ["TypingCommiter"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .nonNull(.scalar(Int.self))),
          GraphQLField("conversation_id", type: .scalar(Int.self)),
          GraphQLField("conversation_type", type: .scalar(String.self)),
          GraphQLField("receiver_id", type: .scalar(Int.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(action: Int, conversationId: Int? = nil, conversationType: String? = nil, receiverId: Int? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "TypingCommiter", "action": action, "conversation_id": conversationId, "conversation_type": conversationType, "receiver_id": receiverId, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Action Enum values : <br>
        /// ################################# 0 : START_TYPING <br>
        /// ################################# 1 : STOP_TYPING
        public var action: Int {
          get {
            return snapshot["action"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "action")
          }
        }

        /// Conversation ID that the typing happened within
        public var conversationId: Int? {
          get {
            return snapshot["conversation_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        public var conversationType: String? {
          get {
            return snapshot["conversation_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_type")
          }
        }

        public var receiverId: Int? {
          get {
            return snapshot["receiver_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "receiver_id")
          }
        }

        /// User ID that committed the typing action
        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class AddUserGroupConversationMutation: GraphQLMutation {
  public static let operationString =
    "mutation AddUserGroupConversation($group_conversation_id: Int!, $receiver_id: Int!, $user_id: Int!) {\n  addUserGroupConversation(group_conversation_id: $group_conversation_id, receiver_id: $receiver_id, user_id: $user_id) {\n    __typename\n    action_type\n    conversation {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    receiver_id\n    seen {\n      __typename\n      conversation_id\n      last_msg_seen_id\n    }\n    typing {\n      __typename\n      action\n      conversation_id\n      conversation_type\n      receiver_id\n      user_id\n    }\n  }\n}"

  public var group_conversation_id: Int
  public var receiver_id: Int
  public var user_id: Int

  public init(group_conversation_id: Int, receiver_id: Int, user_id: Int) {
    self.group_conversation_id = group_conversation_id
    self.receiver_id = receiver_id
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["group_conversation_id": group_conversation_id, "receiver_id": receiver_id, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addUserGroupConversation", arguments: ["group_conversation_id": GraphQLVariable("group_conversation_id"), "receiver_id": GraphQLVariable("receiver_id"), "user_id": GraphQLVariable("user_id")], type: .object(AddUserGroupConversation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(addUserGroupConversation: AddUserGroupConversation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "addUserGroupConversation": addUserGroupConversation.flatMap { $0.snapshot }])
    }

    public var addUserGroupConversation: AddUserGroupConversation? {
      get {
        return (snapshot["addUserGroupConversation"] as? Snapshot).flatMap { AddUserGroupConversation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "addUserGroupConversation")
      }
    }

    public struct AddUserGroupConversation: GraphQLSelectionSet {
      public static let possibleTypes = ["UserIdGenericOutput"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action_type", type: .scalar(Int.self)),
        GraphQLField("conversation", type: .object(Conversation.selections)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("seen", type: .object(Seen.selections)),
        GraphQLField("typing", type: .object(Typing.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(actionType: Int? = nil, conversation: Conversation? = nil, message: Message? = nil, receiverId: Int? = nil, seen: Seen? = nil, typing: Typing? = nil) {
        self.init(snapshot: ["__typename": "UserIdGenericOutput", "action_type": actionType, "conversation": conversation.flatMap { $0.snapshot }, "message": message.flatMap { $0.snapshot }, "receiver_id": receiverId, "seen": seen.flatMap { $0.snapshot }, "typing": typing.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// action_type Enum values : <br>
      /// ################################# 0 : NEW_MESSAGE <br>
      /// ################################# 1 : TYPING <br>
      /// ################################# 2 : SEEN <br>
      /// ################################# 3 : NEW_CONVERSATION <br>
      /// ################################# 4 : JOINED_FOR_GROUP_CONVERSATION <br>
      public var actionType: Int? {
        get {
          return snapshot["action_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "action_type")
        }
      }

      /// New-Conversation in case of action_type = 3
      public var conversation: Conversation? {
        get {
          return (snapshot["conversation"] as? Snapshot).flatMap { Conversation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "conversation")
        }
      }

      /// Message body in case if action_type is 0
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The User ID that will receive this output through subscribeByUserID
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// Seen information in case of action_type = 2
      public var seen: Seen? {
        get {
          return (snapshot["seen"] as? Snapshot).flatMap { Seen(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "seen")
        }
      }

      /// Typing infromation in case if action_type is 1
      public var typing: Typing? {
        get {
          return (snapshot["typing"] as? Snapshot).flatMap { Typing(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "typing")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem_startConversation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem_startConversation", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be chaned on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct Seen: GraphQLSelectionSet {
        public static let possibleTypes = ["SeenOutput"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_msg_seen_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastMsgSeenId: Int) {
          self.init(snapshot: ["__typename": "SeenOutput", "conversation_id": conversationId, "last_msg_seen_id": lastMsgSeenId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The conversation which the other client marked as seen
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID of the last seen message on the other client
        public var lastMsgSeenId: Int {
          get {
            return snapshot["last_msg_seen_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_seen_id")
          }
        }
      }

      public struct Typing: GraphQLSelectionSet {
        public static let possibleTypes = ["TypingCommiter"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .nonNull(.scalar(Int.self))),
          GraphQLField("conversation_id", type: .scalar(Int.self)),
          GraphQLField("conversation_type", type: .scalar(String.self)),
          GraphQLField("receiver_id", type: .scalar(Int.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(action: Int, conversationId: Int? = nil, conversationType: String? = nil, receiverId: Int? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "TypingCommiter", "action": action, "conversation_id": conversationId, "conversation_type": conversationType, "receiver_id": receiverId, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Action Enum values : <br>
        /// ################################# 0 : START_TYPING <br>
        /// ################################# 1 : STOP_TYPING
        public var action: Int {
          get {
            return snapshot["action"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "action")
          }
        }

        /// Conversation ID that the typing happened within
        public var conversationId: Int? {
          get {
            return snapshot["conversation_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        public var conversationType: String? {
          get {
            return snapshot["conversation_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_type")
          }
        }

        public var receiverId: Int? {
          get {
            return snapshot["receiver_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "receiver_id")
          }
        }

        /// User ID that committed the typing action
        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class ChangeOnlineStatusMutation: GraphQLMutation {
  public static let operationString =
    "mutation ChangeOnlineStatus($is_online: Boolean!, $user_id: Int!) {\n  changeOnlineStatus(is_online: $is_online, user_id: $user_id) {\n    __typename\n    is_online\n    last_seen\n  }\n}"

  public var is_online: Bool
  public var user_id: Int

  public init(is_online: Bool, user_id: Int) {
    self.is_online = is_online
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["is_online": is_online, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("changeOnlineStatus", arguments: ["is_online": GraphQLVariable("is_online"), "user_id": GraphQLVariable("user_id")], type: .object(ChangeOnlineStatus.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(changeOnlineStatus: ChangeOnlineStatus? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "changeOnlineStatus": changeOnlineStatus.flatMap { $0.snapshot }])
    }

    /// Specifies whether the user is online of offline, this will persist in the database so other users can query about it
    public var changeOnlineStatus: ChangeOnlineStatus? {
      get {
        return (snapshot["changeOnlineStatus"] as? Snapshot).flatMap { ChangeOnlineStatus(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "changeOnlineStatus")
      }
    }

    public struct ChangeOnlineStatus: GraphQLSelectionSet {
      public static let possibleTypes = ["SignalOnlineStatus"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("is_online", type: .scalar(Bool.self)),
        GraphQLField("last_seen", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(isOnline: Bool? = nil, lastSeen: String? = nil) {
        self.init(snapshot: ["__typename": "SignalOnlineStatus", "is_online": isOnline, "last_seen": lastSeen])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Detemines whether the user last_seen is no more 5 seconds past from the time of calling getUserOnlineStatus
      public var isOnline: Bool? {
        get {
          return snapshot["is_online"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "is_online")
        }
      }

      /// Unix timestamp in mille-seconds
      public var lastSeen: String? {
        get {
          return snapshot["last_seen"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_seen")
        }
      }
    }
  }
}

public final class LeaveGroupConversationMutation: GraphQLMutation {
  public static let operationString =
    "mutation LeaveGroupConversation($group_conversation_id: Int!, $user_id: Int!) {\n  leaveGroupConversation(group_conversation_id: $group_conversation_id, user_id: $user_id) {\n    __typename\n    action_type\n    conversation {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    receiver_id\n    seen {\n      __typename\n      conversation_id\n      last_msg_seen_id\n    }\n    typing {\n      __typename\n      action\n      conversation_id\n      conversation_type\n      receiver_id\n      user_id\n    }\n  }\n}"

  public var group_conversation_id: Int
  public var user_id: Int

  public init(group_conversation_id: Int, user_id: Int) {
    self.group_conversation_id = group_conversation_id
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["group_conversation_id": group_conversation_id, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("leaveGroupConversation", arguments: ["group_conversation_id": GraphQLVariable("group_conversation_id"), "user_id": GraphQLVariable("user_id")], type: .object(LeaveGroupConversation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(leaveGroupConversation: LeaveGroupConversation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "leaveGroupConversation": leaveGroupConversation.flatMap { $0.snapshot }])
    }

    public var leaveGroupConversation: LeaveGroupConversation? {
      get {
        return (snapshot["leaveGroupConversation"] as? Snapshot).flatMap { LeaveGroupConversation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "leaveGroupConversation")
      }
    }

    public struct LeaveGroupConversation: GraphQLSelectionSet {
      public static let possibleTypes = ["UserIdGenericOutput"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action_type", type: .scalar(Int.self)),
        GraphQLField("conversation", type: .object(Conversation.selections)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("seen", type: .object(Seen.selections)),
        GraphQLField("typing", type: .object(Typing.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(actionType: Int? = nil, conversation: Conversation? = nil, message: Message? = nil, receiverId: Int? = nil, seen: Seen? = nil, typing: Typing? = nil) {
        self.init(snapshot: ["__typename": "UserIdGenericOutput", "action_type": actionType, "conversation": conversation.flatMap { $0.snapshot }, "message": message.flatMap { $0.snapshot }, "receiver_id": receiverId, "seen": seen.flatMap { $0.snapshot }, "typing": typing.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// action_type Enum values : <br>
      /// ################################# 0 : NEW_MESSAGE <br>
      /// ################################# 1 : TYPING <br>
      /// ################################# 2 : SEEN <br>
      /// ################################# 3 : NEW_CONVERSATION <br>
      /// ################################# 4 : JOINED_FOR_GROUP_CONVERSATION <br>
      public var actionType: Int? {
        get {
          return snapshot["action_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "action_type")
        }
      }

      /// New-Conversation in case of action_type = 3
      public var conversation: Conversation? {
        get {
          return (snapshot["conversation"] as? Snapshot).flatMap { Conversation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "conversation")
        }
      }

      /// Message body in case if action_type is 0
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The User ID that will receive this output through subscribeByUserID
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// Seen information in case of action_type = 2
      public var seen: Seen? {
        get {
          return (snapshot["seen"] as? Snapshot).flatMap { Seen(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "seen")
        }
      }

      /// Typing infromation in case if action_type is 1
      public var typing: Typing? {
        get {
          return (snapshot["typing"] as? Snapshot).flatMap { Typing(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "typing")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem_startConversation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem_startConversation", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be chaned on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct Seen: GraphQLSelectionSet {
        public static let possibleTypes = ["SeenOutput"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_msg_seen_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastMsgSeenId: Int) {
          self.init(snapshot: ["__typename": "SeenOutput", "conversation_id": conversationId, "last_msg_seen_id": lastMsgSeenId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The conversation which the other client marked as seen
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID of the last seen message on the other client
        public var lastMsgSeenId: Int {
          get {
            return snapshot["last_msg_seen_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_seen_id")
          }
        }
      }

      public struct Typing: GraphQLSelectionSet {
        public static let possibleTypes = ["TypingCommiter"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .nonNull(.scalar(Int.self))),
          GraphQLField("conversation_id", type: .scalar(Int.self)),
          GraphQLField("conversation_type", type: .scalar(String.self)),
          GraphQLField("receiver_id", type: .scalar(Int.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(action: Int, conversationId: Int? = nil, conversationType: String? = nil, receiverId: Int? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "TypingCommiter", "action": action, "conversation_id": conversationId, "conversation_type": conversationType, "receiver_id": receiverId, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Action Enum values : <br>
        /// ################################# 0 : START_TYPING <br>
        /// ################################# 1 : STOP_TYPING
        public var action: Int {
          get {
            return snapshot["action"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "action")
          }
        }

        /// Conversation ID that the typing happened within
        public var conversationId: Int? {
          get {
            return snapshot["conversation_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        public var conversationType: String? {
          get {
            return snapshot["conversation_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_type")
          }
        }

        public var receiverId: Int? {
          get {
            return snapshot["receiver_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "receiver_id")
          }
        }

        /// User ID that committed the typing action
        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class NewGroupAddedMutation: GraphQLMutation {
  public static let operationString =
    "mutation NewGroupAdded($group_id: Int!, $receiver_id: Int!) {\n  newGroupAdded(group_id: $group_id, receiver_id: $receiver_id) {\n    __typename\n    action_type\n    conversation {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    receiver_id\n    seen {\n      __typename\n      conversation_id\n      last_msg_seen_id\n    }\n    typing {\n      __typename\n      action\n      conversation_id\n      conversation_type\n      receiver_id\n      user_id\n    }\n  }\n}"

  public var group_id: Int
  public var receiver_id: Int

  public init(group_id: Int, receiver_id: Int) {
    self.group_id = group_id
    self.receiver_id = receiver_id
  }

  public var variables: GraphQLMap? {
    return ["group_id": group_id, "receiver_id": receiver_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("newGroupAdded", arguments: ["group_id": GraphQLVariable("group_id"), "receiver_id": GraphQLVariable("receiver_id")], type: .object(NewGroupAdded.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(newGroupAdded: NewGroupAdded? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "newGroupAdded": newGroupAdded.flatMap { $0.snapshot }])
    }

    /// ***
    /// ################################# Group mutations
    /// ################################# ***
    public var newGroupAdded: NewGroupAdded? {
      get {
        return (snapshot["newGroupAdded"] as? Snapshot).flatMap { NewGroupAdded(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "newGroupAdded")
      }
    }

    public struct NewGroupAdded: GraphQLSelectionSet {
      public static let possibleTypes = ["UserIdGenericOutput"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action_type", type: .scalar(Int.self)),
        GraphQLField("conversation", type: .object(Conversation.selections)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("seen", type: .object(Seen.selections)),
        GraphQLField("typing", type: .object(Typing.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(actionType: Int? = nil, conversation: Conversation? = nil, message: Message? = nil, receiverId: Int? = nil, seen: Seen? = nil, typing: Typing? = nil) {
        self.init(snapshot: ["__typename": "UserIdGenericOutput", "action_type": actionType, "conversation": conversation.flatMap { $0.snapshot }, "message": message.flatMap { $0.snapshot }, "receiver_id": receiverId, "seen": seen.flatMap { $0.snapshot }, "typing": typing.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// action_type Enum values : <br>
      /// ################################# 0 : NEW_MESSAGE <br>
      /// ################################# 1 : TYPING <br>
      /// ################################# 2 : SEEN <br>
      /// ################################# 3 : NEW_CONVERSATION <br>
      /// ################################# 4 : JOINED_FOR_GROUP_CONVERSATION <br>
      public var actionType: Int? {
        get {
          return snapshot["action_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "action_type")
        }
      }

      /// New-Conversation in case of action_type = 3
      public var conversation: Conversation? {
        get {
          return (snapshot["conversation"] as? Snapshot).flatMap { Conversation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "conversation")
        }
      }

      /// Message body in case if action_type is 0
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The User ID that will receive this output through subscribeByUserID
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// Seen information in case of action_type = 2
      public var seen: Seen? {
        get {
          return (snapshot["seen"] as? Snapshot).flatMap { Seen(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "seen")
        }
      }

      /// Typing infromation in case if action_type is 1
      public var typing: Typing? {
        get {
          return (snapshot["typing"] as? Snapshot).flatMap { Typing(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "typing")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem_startConversation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem_startConversation", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be chaned on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct Seen: GraphQLSelectionSet {
        public static let possibleTypes = ["SeenOutput"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_msg_seen_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastMsgSeenId: Int) {
          self.init(snapshot: ["__typename": "SeenOutput", "conversation_id": conversationId, "last_msg_seen_id": lastMsgSeenId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The conversation which the other client marked as seen
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID of the last seen message on the other client
        public var lastMsgSeenId: Int {
          get {
            return snapshot["last_msg_seen_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_seen_id")
          }
        }
      }

      public struct Typing: GraphQLSelectionSet {
        public static let possibleTypes = ["TypingCommiter"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .nonNull(.scalar(Int.self))),
          GraphQLField("conversation_id", type: .scalar(Int.self)),
          GraphQLField("conversation_type", type: .scalar(String.self)),
          GraphQLField("receiver_id", type: .scalar(Int.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(action: Int, conversationId: Int? = nil, conversationType: String? = nil, receiverId: Int? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "TypingCommiter", "action": action, "conversation_id": conversationId, "conversation_type": conversationType, "receiver_id": receiverId, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Action Enum values : <br>
        /// ################################# 0 : START_TYPING <br>
        /// ################################# 1 : STOP_TYPING
        public var action: Int {
          get {
            return snapshot["action"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "action")
          }
        }

        /// Conversation ID that the typing happened within
        public var conversationId: Int? {
          get {
            return snapshot["conversation_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        public var conversationType: String? {
          get {
            return snapshot["conversation_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_type")
          }
        }

        public var receiverId: Int? {
          get {
            return snapshot["receiver_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "receiver_id")
          }
        }

        /// User ID that committed the typing action
        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class PublishTypingMutation: GraphQLMutation {
  public static let operationString =
    "mutation PublishTyping($action: Int!, $conversation_id: Int!, $receiver_id: Int!, $user_id: Int!) {\n  publishTyping(action: $action, conversation_id: $conversation_id, receiver_id: $receiver_id, user_id: $user_id) {\n    __typename\n    action_type\n    conversation {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    receiver_id\n    seen {\n      __typename\n      conversation_id\n      last_msg_seen_id\n    }\n    typing {\n      __typename\n      action\n      conversation_id\n      conversation_type\n      receiver_id\n      user_id\n    }\n  }\n}"

  public var action: Int
  public var conversation_id: Int
  public var receiver_id: Int
  public var user_id: Int

  public init(action: Int, conversation_id: Int, receiver_id: Int, user_id: Int) {
    self.action = action
    self.conversation_id = conversation_id
    self.receiver_id = receiver_id
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["action": action, "conversation_id": conversation_id, "receiver_id": receiver_id, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("publishTyping", arguments: ["action": GraphQLVariable("action"), "conversation_id": GraphQLVariable("conversation_id"), "receiver_id": GraphQLVariable("receiver_id"), "user_id": GraphQLVariable("user_id")], type: .object(PublishTyping.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(publishTyping: PublishTyping? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "publishTyping": publishTyping.flatMap { $0.snapshot }])
    }

    /// Publish typing so the other parties of the conversation will know when you started typing and when you finished
    public var publishTyping: PublishTyping? {
      get {
        return (snapshot["publishTyping"] as? Snapshot).flatMap { PublishTyping(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "publishTyping")
      }
    }

    public struct PublishTyping: GraphQLSelectionSet {
      public static let possibleTypes = ["UserIdGenericOutput"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action_type", type: .scalar(Int.self)),
        GraphQLField("conversation", type: .object(Conversation.selections)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("seen", type: .object(Seen.selections)),
        GraphQLField("typing", type: .object(Typing.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(actionType: Int? = nil, conversation: Conversation? = nil, message: Message? = nil, receiverId: Int? = nil, seen: Seen? = nil, typing: Typing? = nil) {
        self.init(snapshot: ["__typename": "UserIdGenericOutput", "action_type": actionType, "conversation": conversation.flatMap { $0.snapshot }, "message": message.flatMap { $0.snapshot }, "receiver_id": receiverId, "seen": seen.flatMap { $0.snapshot }, "typing": typing.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// action_type Enum values : <br>
      /// ################################# 0 : NEW_MESSAGE <br>
      /// ################################# 1 : TYPING <br>
      /// ################################# 2 : SEEN <br>
      /// ################################# 3 : NEW_CONVERSATION <br>
      /// ################################# 4 : JOINED_FOR_GROUP_CONVERSATION <br>
      public var actionType: Int? {
        get {
          return snapshot["action_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "action_type")
        }
      }

      /// New-Conversation in case of action_type = 3
      public var conversation: Conversation? {
        get {
          return (snapshot["conversation"] as? Snapshot).flatMap { Conversation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "conversation")
        }
      }

      /// Message body in case if action_type is 0
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The User ID that will receive this output through subscribeByUserID
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// Seen information in case of action_type = 2
      public var seen: Seen? {
        get {
          return (snapshot["seen"] as? Snapshot).flatMap { Seen(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "seen")
        }
      }

      /// Typing infromation in case if action_type is 1
      public var typing: Typing? {
        get {
          return (snapshot["typing"] as? Snapshot).flatMap { Typing(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "typing")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem_startConversation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem_startConversation", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be chaned on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct Seen: GraphQLSelectionSet {
        public static let possibleTypes = ["SeenOutput"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_msg_seen_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastMsgSeenId: Int) {
          self.init(snapshot: ["__typename": "SeenOutput", "conversation_id": conversationId, "last_msg_seen_id": lastMsgSeenId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The conversation which the other client marked as seen
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID of the last seen message on the other client
        public var lastMsgSeenId: Int {
          get {
            return snapshot["last_msg_seen_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_seen_id")
          }
        }
      }

      public struct Typing: GraphQLSelectionSet {
        public static let possibleTypes = ["TypingCommiter"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .nonNull(.scalar(Int.self))),
          GraphQLField("conversation_id", type: .scalar(Int.self)),
          GraphQLField("conversation_type", type: .scalar(String.self)),
          GraphQLField("receiver_id", type: .scalar(Int.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(action: Int, conversationId: Int? = nil, conversationType: String? = nil, receiverId: Int? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "TypingCommiter", "action": action, "conversation_id": conversationId, "conversation_type": conversationType, "receiver_id": receiverId, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Action Enum values : <br>
        /// ################################# 0 : START_TYPING <br>
        /// ################################# 1 : STOP_TYPING
        public var action: Int {
          get {
            return snapshot["action"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "action")
          }
        }

        /// Conversation ID that the typing happened within
        public var conversationId: Int? {
          get {
            return snapshot["conversation_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        public var conversationType: String? {
          get {
            return snapshot["conversation_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_type")
          }
        }

        public var receiverId: Int? {
          get {
            return snapshot["receiver_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "receiver_id")
          }
        }

        /// User ID that committed the typing action
        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class PublishTypingGroupConversationMutation: GraphQLMutation {
  public static let operationString =
    "mutation PublishTypingGroupConversation($group_conversation_id: Int!, $user_id: Int!) {\n  publishTypingGroupConversation(group_conversation_id: $group_conversation_id, user_id: $user_id) {\n    __typename\n    action_type\n    conversation {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    receiver_id\n    seen {\n      __typename\n      conversation_id\n      last_msg_seen_id\n    }\n    typing {\n      __typename\n      action\n      conversation_id\n      conversation_type\n      receiver_id\n      user_id\n    }\n  }\n}"

  public var group_conversation_id: Int
  public var user_id: Int

  public init(group_conversation_id: Int, user_id: Int) {
    self.group_conversation_id = group_conversation_id
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["group_conversation_id": group_conversation_id, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("publishTypingGroupConversation", arguments: ["group_conversation_id": GraphQLVariable("group_conversation_id"), "user_id": GraphQLVariable("user_id")], type: .object(PublishTypingGroupConversation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(publishTypingGroupConversation: PublishTypingGroupConversation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "publishTypingGroupConversation": publishTypingGroupConversation.flatMap { $0.snapshot }])
    }

    public var publishTypingGroupConversation: PublishTypingGroupConversation? {
      get {
        return (snapshot["publishTypingGroupConversation"] as? Snapshot).flatMap { PublishTypingGroupConversation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "publishTypingGroupConversation")
      }
    }

    public struct PublishTypingGroupConversation: GraphQLSelectionSet {
      public static let possibleTypes = ["UserIdGenericOutput"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action_type", type: .scalar(Int.self)),
        GraphQLField("conversation", type: .object(Conversation.selections)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("seen", type: .object(Seen.selections)),
        GraphQLField("typing", type: .object(Typing.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(actionType: Int? = nil, conversation: Conversation? = nil, message: Message? = nil, receiverId: Int? = nil, seen: Seen? = nil, typing: Typing? = nil) {
        self.init(snapshot: ["__typename": "UserIdGenericOutput", "action_type": actionType, "conversation": conversation.flatMap { $0.snapshot }, "message": message.flatMap { $0.snapshot }, "receiver_id": receiverId, "seen": seen.flatMap { $0.snapshot }, "typing": typing.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// action_type Enum values : <br>
      /// ################################# 0 : NEW_MESSAGE <br>
      /// ################################# 1 : TYPING <br>
      /// ################################# 2 : SEEN <br>
      /// ################################# 3 : NEW_CONVERSATION <br>
      /// ################################# 4 : JOINED_FOR_GROUP_CONVERSATION <br>
      public var actionType: Int? {
        get {
          return snapshot["action_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "action_type")
        }
      }

      /// New-Conversation in case of action_type = 3
      public var conversation: Conversation? {
        get {
          return (snapshot["conversation"] as? Snapshot).flatMap { Conversation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "conversation")
        }
      }

      /// Message body in case if action_type is 0
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The User ID that will receive this output through subscribeByUserID
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// Seen information in case of action_type = 2
      public var seen: Seen? {
        get {
          return (snapshot["seen"] as? Snapshot).flatMap { Seen(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "seen")
        }
      }

      /// Typing infromation in case if action_type is 1
      public var typing: Typing? {
        get {
          return (snapshot["typing"] as? Snapshot).flatMap { Typing(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "typing")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem_startConversation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem_startConversation", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be chaned on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct Seen: GraphQLSelectionSet {
        public static let possibleTypes = ["SeenOutput"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_msg_seen_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastMsgSeenId: Int) {
          self.init(snapshot: ["__typename": "SeenOutput", "conversation_id": conversationId, "last_msg_seen_id": lastMsgSeenId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The conversation which the other client marked as seen
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID of the last seen message on the other client
        public var lastMsgSeenId: Int {
          get {
            return snapshot["last_msg_seen_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_seen_id")
          }
        }
      }

      public struct Typing: GraphQLSelectionSet {
        public static let possibleTypes = ["TypingCommiter"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .nonNull(.scalar(Int.self))),
          GraphQLField("conversation_id", type: .scalar(Int.self)),
          GraphQLField("conversation_type", type: .scalar(String.self)),
          GraphQLField("receiver_id", type: .scalar(Int.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(action: Int, conversationId: Int? = nil, conversationType: String? = nil, receiverId: Int? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "TypingCommiter", "action": action, "conversation_id": conversationId, "conversation_type": conversationType, "receiver_id": receiverId, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Action Enum values : <br>
        /// ################################# 0 : START_TYPING <br>
        /// ################################# 1 : STOP_TYPING
        public var action: Int {
          get {
            return snapshot["action"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "action")
          }
        }

        /// Conversation ID that the typing happened within
        public var conversationId: Int? {
          get {
            return snapshot["conversation_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        public var conversationType: String? {
          get {
            return snapshot["conversation_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_type")
          }
        }

        public var receiverId: Int? {
          get {
            return snapshot["receiver_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "receiver_id")
          }
        }

        /// User ID that committed the typing action
        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class RemoveUserGroupConversationMutation: GraphQLMutation {
  public static let operationString =
    "mutation RemoveUserGroupConversation($group_conversation_id: Int!, $user_id: Int!) {\n  removeUserGroupConversation(group_conversation_id: $group_conversation_id, user_id: $user_id) {\n    __typename\n    action_type\n    conversation {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    receiver_id\n    seen {\n      __typename\n      conversation_id\n      last_msg_seen_id\n    }\n    typing {\n      __typename\n      action\n      conversation_id\n      conversation_type\n      receiver_id\n      user_id\n    }\n  }\n}"

  public var group_conversation_id: Int
  public var user_id: Int

  public init(group_conversation_id: Int, user_id: Int) {
    self.group_conversation_id = group_conversation_id
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["group_conversation_id": group_conversation_id, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("removeUserGroupConversation", arguments: ["group_conversation_id": GraphQLVariable("group_conversation_id"), "user_id": GraphQLVariable("user_id")], type: .object(RemoveUserGroupConversation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(removeUserGroupConversation: RemoveUserGroupConversation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "removeUserGroupConversation": removeUserGroupConversation.flatMap { $0.snapshot }])
    }

    public var removeUserGroupConversation: RemoveUserGroupConversation? {
      get {
        return (snapshot["removeUserGroupConversation"] as? Snapshot).flatMap { RemoveUserGroupConversation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "removeUserGroupConversation")
      }
    }

    public struct RemoveUserGroupConversation: GraphQLSelectionSet {
      public static let possibleTypes = ["UserIdGenericOutput"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action_type", type: .scalar(Int.self)),
        GraphQLField("conversation", type: .object(Conversation.selections)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("seen", type: .object(Seen.selections)),
        GraphQLField("typing", type: .object(Typing.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(actionType: Int? = nil, conversation: Conversation? = nil, message: Message? = nil, receiverId: Int? = nil, seen: Seen? = nil, typing: Typing? = nil) {
        self.init(snapshot: ["__typename": "UserIdGenericOutput", "action_type": actionType, "conversation": conversation.flatMap { $0.snapshot }, "message": message.flatMap { $0.snapshot }, "receiver_id": receiverId, "seen": seen.flatMap { $0.snapshot }, "typing": typing.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// action_type Enum values : <br>
      /// ################################# 0 : NEW_MESSAGE <br>
      /// ################################# 1 : TYPING <br>
      /// ################################# 2 : SEEN <br>
      /// ################################# 3 : NEW_CONVERSATION <br>
      /// ################################# 4 : JOINED_FOR_GROUP_CONVERSATION <br>
      public var actionType: Int? {
        get {
          return snapshot["action_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "action_type")
        }
      }

      /// New-Conversation in case of action_type = 3
      public var conversation: Conversation? {
        get {
          return (snapshot["conversation"] as? Snapshot).flatMap { Conversation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "conversation")
        }
      }

      /// Message body in case if action_type is 0
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The User ID that will receive this output through subscribeByUserID
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// Seen information in case of action_type = 2
      public var seen: Seen? {
        get {
          return (snapshot["seen"] as? Snapshot).flatMap { Seen(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "seen")
        }
      }

      /// Typing infromation in case if action_type is 1
      public var typing: Typing? {
        get {
          return (snapshot["typing"] as? Snapshot).flatMap { Typing(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "typing")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem_startConversation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem_startConversation", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be chaned on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct Seen: GraphQLSelectionSet {
        public static let possibleTypes = ["SeenOutput"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_msg_seen_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastMsgSeenId: Int) {
          self.init(snapshot: ["__typename": "SeenOutput", "conversation_id": conversationId, "last_msg_seen_id": lastMsgSeenId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The conversation which the other client marked as seen
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID of the last seen message on the other client
        public var lastMsgSeenId: Int {
          get {
            return snapshot["last_msg_seen_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_seen_id")
          }
        }
      }

      public struct Typing: GraphQLSelectionSet {
        public static let possibleTypes = ["TypingCommiter"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .nonNull(.scalar(Int.self))),
          GraphQLField("conversation_id", type: .scalar(Int.self)),
          GraphQLField("conversation_type", type: .scalar(String.self)),
          GraphQLField("receiver_id", type: .scalar(Int.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(action: Int, conversationId: Int? = nil, conversationType: String? = nil, receiverId: Int? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "TypingCommiter", "action": action, "conversation_id": conversationId, "conversation_type": conversationType, "receiver_id": receiverId, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Action Enum values : <br>
        /// ################################# 0 : START_TYPING <br>
        /// ################################# 1 : STOP_TYPING
        public var action: Int {
          get {
            return snapshot["action"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "action")
          }
        }

        /// Conversation ID that the typing happened within
        public var conversationId: Int? {
          get {
            return snapshot["conversation_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        public var conversationType: String? {
          get {
            return snapshot["conversation_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_type")
          }
        }

        public var receiverId: Int? {
          get {
            return snapshot["receiver_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "receiver_id")
          }
        }

        /// User ID that committed the typing action
        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class SetSeenConversationMutation: GraphQLMutation {
  public static let operationString =
    "mutation SetSeenConversation($conversation_id: Int!, $last_msg_seen_id: Int!, $receiver_id: Int!) {\n  setSeenConversation(conversation_id: $conversation_id, last_msg_seen_id: $last_msg_seen_id, receiver_id: $receiver_id) {\n    __typename\n    action_type\n    conversation {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    receiver_id\n    seen {\n      __typename\n      conversation_id\n      last_msg_seen_id\n    }\n    typing {\n      __typename\n      action\n      conversation_id\n      conversation_type\n      receiver_id\n      user_id\n    }\n  }\n}"

  public var conversation_id: Int
  public var last_msg_seen_id: Int
  public var receiver_id: Int

  public init(conversation_id: Int, last_msg_seen_id: Int, receiver_id: Int) {
    self.conversation_id = conversation_id
    self.last_msg_seen_id = last_msg_seen_id
    self.receiver_id = receiver_id
  }

  public var variables: GraphQLMap? {
    return ["conversation_id": conversation_id, "last_msg_seen_id": last_msg_seen_id, "receiver_id": receiver_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("setSeenConversation", arguments: ["conversation_id": GraphQLVariable("conversation_id"), "last_msg_seen_id": GraphQLVariable("last_msg_seen_id"), "receiver_id": GraphQLVariable("receiver_id")], type: .object(SetSeenConversation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(setSeenConversation: SetSeenConversation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "setSeenConversation": setSeenConversation.flatMap { $0.snapshot }])
    }

    /// Set all message before "last_msg_seen_id"<Int> as seen in a conversation
    public var setSeenConversation: SetSeenConversation? {
      get {
        return (snapshot["setSeenConversation"] as? Snapshot).flatMap { SetSeenConversation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "setSeenConversation")
      }
    }

    public struct SetSeenConversation: GraphQLSelectionSet {
      public static let possibleTypes = ["UserIdGenericOutput"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action_type", type: .scalar(Int.self)),
        GraphQLField("conversation", type: .object(Conversation.selections)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("seen", type: .object(Seen.selections)),
        GraphQLField("typing", type: .object(Typing.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(actionType: Int? = nil, conversation: Conversation? = nil, message: Message? = nil, receiverId: Int? = nil, seen: Seen? = nil, typing: Typing? = nil) {
        self.init(snapshot: ["__typename": "UserIdGenericOutput", "action_type": actionType, "conversation": conversation.flatMap { $0.snapshot }, "message": message.flatMap { $0.snapshot }, "receiver_id": receiverId, "seen": seen.flatMap { $0.snapshot }, "typing": typing.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// action_type Enum values : <br>
      /// ################################# 0 : NEW_MESSAGE <br>
      /// ################################# 1 : TYPING <br>
      /// ################################# 2 : SEEN <br>
      /// ################################# 3 : NEW_CONVERSATION <br>
      /// ################################# 4 : JOINED_FOR_GROUP_CONVERSATION <br>
      public var actionType: Int? {
        get {
          return snapshot["action_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "action_type")
        }
      }

      /// New-Conversation in case of action_type = 3
      public var conversation: Conversation? {
        get {
          return (snapshot["conversation"] as? Snapshot).flatMap { Conversation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "conversation")
        }
      }

      /// Message body in case if action_type is 0
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The User ID that will receive this output through subscribeByUserID
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// Seen information in case of action_type = 2
      public var seen: Seen? {
        get {
          return (snapshot["seen"] as? Snapshot).flatMap { Seen(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "seen")
        }
      }

      /// Typing infromation in case if action_type is 1
      public var typing: Typing? {
        get {
          return (snapshot["typing"] as? Snapshot).flatMap { Typing(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "typing")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem_startConversation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem_startConversation", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be chaned on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct Seen: GraphQLSelectionSet {
        public static let possibleTypes = ["SeenOutput"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_msg_seen_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastMsgSeenId: Int) {
          self.init(snapshot: ["__typename": "SeenOutput", "conversation_id": conversationId, "last_msg_seen_id": lastMsgSeenId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The conversation which the other client marked as seen
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID of the last seen message on the other client
        public var lastMsgSeenId: Int {
          get {
            return snapshot["last_msg_seen_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_seen_id")
          }
        }
      }

      public struct Typing: GraphQLSelectionSet {
        public static let possibleTypes = ["TypingCommiter"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .nonNull(.scalar(Int.self))),
          GraphQLField("conversation_id", type: .scalar(Int.self)),
          GraphQLField("conversation_type", type: .scalar(String.self)),
          GraphQLField("receiver_id", type: .scalar(Int.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(action: Int, conversationId: Int? = nil, conversationType: String? = nil, receiverId: Int? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "TypingCommiter", "action": action, "conversation_id": conversationId, "conversation_type": conversationType, "receiver_id": receiverId, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Action Enum values : <br>
        /// ################################# 0 : START_TYPING <br>
        /// ################################# 1 : STOP_TYPING
        public var action: Int {
          get {
            return snapshot["action"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "action")
          }
        }

        /// Conversation ID that the typing happened within
        public var conversationId: Int? {
          get {
            return snapshot["conversation_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        public var conversationType: String? {
          get {
            return snapshot["conversation_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_type")
          }
        }

        public var receiverId: Int? {
          get {
            return snapshot["receiver_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "receiver_id")
          }
        }

        /// User ID that committed the typing action
        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class StartConversationMutation: GraphQLMutation {
  public static let operationString =
    "mutation StartConversation($message: MessageInput, $receiver_id: Int!, $sender_id: Int!) {\n  startConversation(message: $message, receiver_id: $receiver_id, sender_id: $sender_id) {\n    __typename\n    action_type\n    conversation {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    receiver_id\n    seen {\n      __typename\n      conversation_id\n      last_msg_seen_id\n    }\n    typing {\n      __typename\n      action\n      conversation_id\n      conversation_type\n      receiver_id\n      user_id\n    }\n  }\n}"

  public var message: MessageInput?
  public var receiver_id: Int
  public var sender_id: Int

  public init(message: MessageInput? = nil, receiver_id: Int, sender_id: Int) {
    self.message = message
    self.receiver_id = receiver_id
    self.sender_id = sender_id
  }

  public var variables: GraphQLMap? {
    return ["message": message, "receiver_id": receiver_id, "sender_id": sender_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("startConversation", arguments: ["message": GraphQLVariable("message"), "receiver_id": GraphQLVariable("receiver_id"), "sender_id": GraphQLVariable("sender_id")], type: .object(StartConversation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(startConversation: StartConversation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "startConversation": startConversation.flatMap { $0.snapshot }])
    }

    /// Start a conversation between two users <br>
    /// ############################# The receiver user will get be notified of new conversation through the subscription <br>
    public var startConversation: StartConversation? {
      get {
        return (snapshot["startConversation"] as? Snapshot).flatMap { StartConversation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "startConversation")
      }
    }

    public struct StartConversation: GraphQLSelectionSet {
      public static let possibleTypes = ["UserIdGenericOutput"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action_type", type: .scalar(Int.self)),
        GraphQLField("conversation", type: .object(Conversation.selections)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("seen", type: .object(Seen.selections)),
        GraphQLField("typing", type: .object(Typing.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(actionType: Int? = nil, conversation: Conversation? = nil, message: Message? = nil, receiverId: Int? = nil, seen: Seen? = nil, typing: Typing? = nil) {
        self.init(snapshot: ["__typename": "UserIdGenericOutput", "action_type": actionType, "conversation": conversation.flatMap { $0.snapshot }, "message": message.flatMap { $0.snapshot }, "receiver_id": receiverId, "seen": seen.flatMap { $0.snapshot }, "typing": typing.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// action_type Enum values : <br>
      /// ################################# 0 : NEW_MESSAGE <br>
      /// ################################# 1 : TYPING <br>
      /// ################################# 2 : SEEN <br>
      /// ################################# 3 : NEW_CONVERSATION <br>
      /// ################################# 4 : JOINED_FOR_GROUP_CONVERSATION <br>
      public var actionType: Int? {
        get {
          return snapshot["action_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "action_type")
        }
      }

      /// New-Conversation in case of action_type = 3
      public var conversation: Conversation? {
        get {
          return (snapshot["conversation"] as? Snapshot).flatMap { Conversation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "conversation")
        }
      }

      /// Message body in case if action_type is 0
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The User ID that will receive this output through subscribeByUserID
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// Seen information in case of action_type = 2
      public var seen: Seen? {
        get {
          return (snapshot["seen"] as? Snapshot).flatMap { Seen(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "seen")
        }
      }

      /// Typing infromation in case if action_type is 1
      public var typing: Typing? {
        get {
          return (snapshot["typing"] as? Snapshot).flatMap { Typing(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "typing")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem_startConversation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem_startConversation", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be chaned on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct Seen: GraphQLSelectionSet {
        public static let possibleTypes = ["SeenOutput"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_msg_seen_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastMsgSeenId: Int) {
          self.init(snapshot: ["__typename": "SeenOutput", "conversation_id": conversationId, "last_msg_seen_id": lastMsgSeenId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The conversation which the other client marked as seen
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID of the last seen message on the other client
        public var lastMsgSeenId: Int {
          get {
            return snapshot["last_msg_seen_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_seen_id")
          }
        }
      }

      public struct Typing: GraphQLSelectionSet {
        public static let possibleTypes = ["TypingCommiter"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .nonNull(.scalar(Int.self))),
          GraphQLField("conversation_id", type: .scalar(Int.self)),
          GraphQLField("conversation_type", type: .scalar(String.self)),
          GraphQLField("receiver_id", type: .scalar(Int.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(action: Int, conversationId: Int? = nil, conversationType: String? = nil, receiverId: Int? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "TypingCommiter", "action": action, "conversation_id": conversationId, "conversation_type": conversationType, "receiver_id": receiverId, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Action Enum values : <br>
        /// ################################# 0 : START_TYPING <br>
        /// ################################# 1 : STOP_TYPING
        public var action: Int {
          get {
            return snapshot["action"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "action")
          }
        }

        /// Conversation ID that the typing happened within
        public var conversationId: Int? {
          get {
            return snapshot["conversation_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        public var conversationType: String? {
          get {
            return snapshot["conversation_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_type")
          }
        }

        public var receiverId: Int? {
          get {
            return snapshot["receiver_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "receiver_id")
          }
        }

        /// User ID that committed the typing action
        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class StartGroupConversationMutation: GraphQLMutation {
  public static let operationString =
    "mutation StartGroupConversation($created_by_id: Int!, $description: String, $members: [GroupMemberInput!], $title: String!) {\n  startGroupConversation(created_by_id: $created_by_id, description: $description, members: $members, title: $title) {\n    __typename\n    conversation_id\n    created_by_id\n    description\n    members {\n      __typename\n      id\n    }\n    title\n  }\n}"

  public var created_by_id: Int
  public var description: String?
  public var members: [GroupMemberInput]?
  public var title: String

  public init(created_by_id: Int, description: String? = nil, members: [GroupMemberInput]?, title: String) {
    self.created_by_id = created_by_id
    self.description = description
    self.members = members
    self.title = title
  }

  public var variables: GraphQLMap? {
    return ["created_by_id": created_by_id, "description": description, "members": members, "title": title]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("startGroupConversation", arguments: ["created_by_id": GraphQLVariable("created_by_id"), "description": GraphQLVariable("description"), "members": GraphQLVariable("members"), "title": GraphQLVariable("title")], type: .object(StartGroupConversation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(startGroupConversation: StartGroupConversation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "startGroupConversation": startGroupConversation.flatMap { $0.snapshot }])
    }

    public var startGroupConversation: StartGroupConversation? {
      get {
        return (snapshot["startGroupConversation"] as? Snapshot).flatMap { StartGroupConversation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "startGroupConversation")
      }
    }

    public struct StartGroupConversation: GraphQLSelectionSet {
      public static let possibleTypes = ["GroupConversation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("created_by_id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("members", type: .list(.nonNull(.object(Member.selections)))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(conversationId: Int, createdById: Int, description: String? = nil, members: [Member]? = nil, title: String) {
        self.init(snapshot: ["__typename": "GroupConversation", "conversation_id": conversationId, "created_by_id": createdById, "description": description, "members": members.flatMap { $0.map { $0.snapshot } }, "title": title])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var conversationId: Int {
        get {
          return snapshot["conversation_id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "conversation_id")
        }
      }

      public var createdById: Int {
        get {
          return snapshot["created_by_id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_by_id")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var members: [Member]? {
        get {
          return (snapshot["members"] as? [Snapshot]).flatMap { $0.map { Member(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "members")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public struct Member: GraphQLSelectionSet {
        public static let possibleTypes = ["GroupMember"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: Int) {
          self.init(snapshot: ["__typename": "GroupMember", "id": id])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return snapshot["id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class StartSupportConversationMutation: GraphQLMutation {
  public static let operationString =
    "mutation StartSupportConversation($sender_id: Int!) {\n  startSupportConversation(sender_id: $sender_id) {\n    __typename\n    conversation_id\n    receiver_id\n    sender_id\n  }\n}"

  public var sender_id: Int

  public init(sender_id: Int) {
    self.sender_id = sender_id
  }

  public var variables: GraphQLMap? {
    return ["sender_id": sender_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("startSupportConversation", arguments: ["sender_id": GraphQLVariable("sender_id")], type: .object(StartSupportConversation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(startSupportConversation: StartSupportConversation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "startSupportConversation": startSupportConversation.flatMap { $0.snapshot }])
    }

    /// Start a conversation with Uhive support agent
    public var startSupportConversation: StartSupportConversation? {
      get {
        return (snapshot["startSupportConversation"] as? Snapshot).flatMap { StartSupportConversation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "startSupportConversation")
      }
    }

    public struct StartSupportConversation: GraphQLSelectionSet {
      public static let possibleTypes = ["Conversation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("conversation_id", type: .scalar(Int.self)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("sender_id", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(conversationId: Int? = nil, receiverId: Int? = nil, senderId: Int? = nil) {
        self.init(snapshot: ["__typename": "Conversation", "conversation_id": conversationId, "receiver_id": receiverId, "sender_id": senderId])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// n/a
      public var conversationId: Int? {
        get {
          return snapshot["conversation_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "conversation_id")
        }
      }

      /// User of the targeted user
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// User ID of the craetor
      public var senderId: Int? {
        get {
          return snapshot["sender_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sender_id")
        }
      }
    }
  }
}

public final class ToggleAdminGroupConversationMutation: GraphQLMutation {
  public static let operationString =
    "mutation ToggleAdminGroupConversation($group_conversation_id: Int!, $user_id: Int!) {\n  toggleAdminGroupConversation(group_conversation_id: $group_conversation_id, user_id: $user_id) {\n    __typename\n    action_type\n    conversation {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    receiver_id\n    seen {\n      __typename\n      conversation_id\n      last_msg_seen_id\n    }\n    typing {\n      __typename\n      action\n      conversation_id\n      conversation_type\n      receiver_id\n      user_id\n    }\n  }\n}"

  public var group_conversation_id: Int
  public var user_id: Int

  public init(group_conversation_id: Int, user_id: Int) {
    self.group_conversation_id = group_conversation_id
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["group_conversation_id": group_conversation_id, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("toggleAdminGroupConversation", arguments: ["group_conversation_id": GraphQLVariable("group_conversation_id"), "user_id": GraphQLVariable("user_id")], type: .object(ToggleAdminGroupConversation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(toggleAdminGroupConversation: ToggleAdminGroupConversation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "toggleAdminGroupConversation": toggleAdminGroupConversation.flatMap { $0.snapshot }])
    }

    public var toggleAdminGroupConversation: ToggleAdminGroupConversation? {
      get {
        return (snapshot["toggleAdminGroupConversation"] as? Snapshot).flatMap { ToggleAdminGroupConversation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "toggleAdminGroupConversation")
      }
    }

    public struct ToggleAdminGroupConversation: GraphQLSelectionSet {
      public static let possibleTypes = ["UserIdGenericOutput"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action_type", type: .scalar(Int.self)),
        GraphQLField("conversation", type: .object(Conversation.selections)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("seen", type: .object(Seen.selections)),
        GraphQLField("typing", type: .object(Typing.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(actionType: Int? = nil, conversation: Conversation? = nil, message: Message? = nil, receiverId: Int? = nil, seen: Seen? = nil, typing: Typing? = nil) {
        self.init(snapshot: ["__typename": "UserIdGenericOutput", "action_type": actionType, "conversation": conversation.flatMap { $0.snapshot }, "message": message.flatMap { $0.snapshot }, "receiver_id": receiverId, "seen": seen.flatMap { $0.snapshot }, "typing": typing.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// action_type Enum values : <br>
      /// ################################# 0 : NEW_MESSAGE <br>
      /// ################################# 1 : TYPING <br>
      /// ################################# 2 : SEEN <br>
      /// ################################# 3 : NEW_CONVERSATION <br>
      /// ################################# 4 : JOINED_FOR_GROUP_CONVERSATION <br>
      public var actionType: Int? {
        get {
          return snapshot["action_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "action_type")
        }
      }

      /// New-Conversation in case of action_type = 3
      public var conversation: Conversation? {
        get {
          return (snapshot["conversation"] as? Snapshot).flatMap { Conversation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "conversation")
        }
      }

      /// Message body in case if action_type is 0
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The User ID that will receive this output through subscribeByUserID
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// Seen information in case of action_type = 2
      public var seen: Seen? {
        get {
          return (snapshot["seen"] as? Snapshot).flatMap { Seen(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "seen")
        }
      }

      /// Typing infromation in case if action_type is 1
      public var typing: Typing? {
        get {
          return (snapshot["typing"] as? Snapshot).flatMap { Typing(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "typing")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem_startConversation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem_startConversation", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be chaned on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct Seen: GraphQLSelectionSet {
        public static let possibleTypes = ["SeenOutput"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_msg_seen_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastMsgSeenId: Int) {
          self.init(snapshot: ["__typename": "SeenOutput", "conversation_id": conversationId, "last_msg_seen_id": lastMsgSeenId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The conversation which the other client marked as seen
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID of the last seen message on the other client
        public var lastMsgSeenId: Int {
          get {
            return snapshot["last_msg_seen_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_seen_id")
          }
        }
      }

      public struct Typing: GraphQLSelectionSet {
        public static let possibleTypes = ["TypingCommiter"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .nonNull(.scalar(Int.self))),
          GraphQLField("conversation_id", type: .scalar(Int.self)),
          GraphQLField("conversation_type", type: .scalar(String.self)),
          GraphQLField("receiver_id", type: .scalar(Int.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(action: Int, conversationId: Int? = nil, conversationType: String? = nil, receiverId: Int? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "TypingCommiter", "action": action, "conversation_id": conversationId, "conversation_type": conversationType, "receiver_id": receiverId, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Action Enum values : <br>
        /// ################################# 0 : START_TYPING <br>
        /// ################################# 1 : STOP_TYPING
        public var action: Int {
          get {
            return snapshot["action"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "action")
          }
        }

        /// Conversation ID that the typing happened within
        public var conversationId: Int? {
          get {
            return snapshot["conversation_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        public var conversationType: String? {
          get {
            return snapshot["conversation_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_type")
          }
        }

        public var receiverId: Int? {
          get {
            return snapshot["receiver_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "receiver_id")
          }
        }

        /// User ID that committed the typing action
        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class SearchQuery: GraphQLQuery {
  public static let operationString =
    "query Search($user_id: Int, $search_key: String, $fetch_count: Int!, $next_token: String) {\n  search(user_id: $user_id, search_key: $search_key, fetch_count: $fetch_count, next_token: $next_token) {\n    __typename\n    conversations {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    next_token\n  }\n}"

  public var user_id: Int?
  public var search_key: String?
  public var fetch_count: Int
  public var next_token: String?

  public init(user_id: Int? = nil, search_key: String? = nil, fetch_count: Int, next_token: String? = nil) {
    self.user_id = user_id
    self.search_key = search_key
    self.fetch_count = fetch_count
    self.next_token = next_token
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id, "search_key": search_key, "fetch_count": fetch_count, "next_token": next_token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", arguments: ["user_id": GraphQLVariable("user_id"), "search_key": GraphQLVariable("search_key"), "fetch_count": GraphQLVariable("fetch_count"), "next_token": GraphQLVariable("next_token")], type: .object(Search.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(search: Search? = nil) {
      self.init(snapshot: ["__typename": "Query", "search": search.flatMap { $0.snapshot }])
    }

    /// search for conversations by Peer name, it is not case sensitive.
    /// # search_key is the search term that will be searched against
    /// # next_token is returned for pagination
    public var search: Search? {
      get {
        return (snapshot["search"] as? Snapshot).flatMap { Search(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes = ["ConversationsList"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("conversations", type: .list(.object(Conversation.selections))),
        GraphQLField("next_token", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(conversations: [Conversation?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ConversationsList", "conversations": conversations.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "next_token": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// returned list of conversations
      public var conversations: [Conversation?]? {
        get {
          return (snapshot["conversations"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Conversation(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "conversations")
        }
      }

      /// use the with getUserConversations_v3 to get the next page of pagination.
      public var nextToken: String? {
        get {
          return snapshot["next_token"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "next_token")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be changed on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }
    }
  }
}

public final class CheckNewActionsConversationQuery: GraphQLQuery {
  public static let operationString =
    "query CheckNewActionsConversation($user_id: Int!, $conversation_id: Int!, $message_id: Int!) {\n  checkNewActionsConversation(user_id: $user_id, conversation_id: $conversation_id, message_id: $message_id) {\n    __typename\n    new_msgs_count\n  }\n}"

  public var user_id: Int
  public var conversation_id: Int
  public var message_id: Int

  public init(user_id: Int, conversation_id: Int, message_id: Int) {
    self.user_id = user_id
    self.conversation_id = conversation_id
    self.message_id = message_id
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id, "conversation_id": conversation_id, "message_id": message_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkNewActionsConversation", arguments: ["user_id": GraphQLVariable("user_id"), "conversation_id": GraphQLVariable("conversation_id"), "message_id": GraphQLVariable("message_id")], type: .object(CheckNewActionsConversation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(checkNewActionsConversation: CheckNewActionsConversation? = nil) {
      self.init(snapshot: ["__typename": "Query", "checkNewActionsConversation": checkNewActionsConversation.flatMap { $0.snapshot }])
    }

    /// Check if chat has new actions
    public var checkNewActionsConversation: CheckNewActionsConversation? {
      get {
        return (snapshot["checkNewActionsConversation"] as? Snapshot).flatMap { CheckNewActionsConversation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "checkNewActionsConversation")
      }
    }

    public struct CheckNewActionsConversation: GraphQLSelectionSet {
      public static let possibleTypes = ["NewActionsConversationType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("new_msgs_count", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(newMsgsCount: Int) {
        self.init(snapshot: ["__typename": "NewActionsConversationType", "new_msgs_count": newMsgsCount])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var newMsgsCount: Int {
        get {
          return snapshot["new_msgs_count"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "new_msgs_count")
        }
      }
    }
  }
}

public final class CheckNewActionsQuery: GraphQLQuery {
  public static let operationString =
    "query CheckNewActions($base_conv: Int, $last_action_id: String, $user_id: Int!) {\n  checkNewActions(base_conv: $base_conv, last_action_id: $last_action_id, user_id: $user_id) {\n    __typename\n    new_actions\n  }\n}"

  public var base_conv: Int?
  public var last_action_id: String?
  public var user_id: Int

  public init(base_conv: Int? = nil, last_action_id: String? = nil, user_id: Int) {
    self.base_conv = base_conv
    self.last_action_id = last_action_id
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["base_conv": base_conv, "last_action_id": last_action_id, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkNewActions", arguments: ["base_conv": GraphQLVariable("base_conv"), "last_action_id": GraphQLVariable("last_action_id"), "user_id": GraphQLVariable("user_id")], type: .object(CheckNewAction.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(checkNewActions: CheckNewAction? = nil) {
      self.init(snapshot: ["__typename": "Query", "checkNewActions": checkNewActions.flatMap { $0.snapshot }])
    }

    /// Check if chat has new actions
    public var checkNewActions: CheckNewAction? {
      get {
        return (snapshot["checkNewActions"] as? Snapshot).flatMap { CheckNewAction(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "checkNewActions")
      }
    }

    public struct CheckNewAction: GraphQLSelectionSet {
      public static let possibleTypes = ["NewActionType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("new_actions", type: .nonNull(.scalar(Bool.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(newActions: Bool) {
        self.init(snapshot: ["__typename": "NewActionType", "new_actions": newActions])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var newActions: Bool {
        get {
          return snapshot["new_actions"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "new_actions")
        }
      }
    }
  }
}

public final class GetConversationQuery: GraphQLQuery {
  public static let operationString =
    "query GetConversation($conversation_id: Int, $peer_id: Int!, $user_id: Int!) {\n  getConversation(conversation_id: $conversation_id, peer_id: $peer_id, user_id: $user_id) {\n    __typename\n    conversation_id\n    last_action\n    last_action_id\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    peer_user {\n      __typename\n      image_last_changed\n      image_type\n      name\n      user_id\n    }\n    timestamp\n    unseen_count\n    last_msg_text\n    last_msg_url\n    last_msg_m_type\n    is_blocked\n    peer_is_blocked\n  }\n}"

  public var conversation_id: Int?
  public var peer_id: Int
  public var user_id: Int

  public init(conversation_id: Int? = nil, peer_id: Int, user_id: Int) {
    self.conversation_id = conversation_id
    self.peer_id = peer_id
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["conversation_id": conversation_id, "peer_id": peer_id, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getConversation", arguments: ["conversation_id": GraphQLVariable("conversation_id"), "peer_id": GraphQLVariable("peer_id"), "user_id": GraphQLVariable("user_id")], type: .object(GetConversation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getConversation: GetConversation? = nil) {
      self.init(snapshot: ["__typename": "Query", "getConversation": getConversation.flatMap { $0.snapshot }])
    }

    /// Get the conversation information, <br>
    /// # Use Case : When you receive/retrieve a message and you dont have information the related conversation<br>
    /// # Use Case : On space page in Uhive App, call this query to get the conversation information if exist.
    public var getConversation: GetConversation? {
      get {
        return (snapshot["getConversation"] as? Snapshot).flatMap { GetConversation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getConversation")
      }
    }

    public struct GetConversation: GraphQLSelectionSet {
      public static let possibleTypes = ["ConversationsListItem"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("last_action", type: .scalar(Int.self)),
        GraphQLField("last_action_id", type: .scalar(String.self)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("peer_user", type: .object(PeerUser.selections)),
        GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
        GraphQLField("unseen_count", type: .scalar(Int.self)),
        GraphQLField("last_msg_text", type: .scalar(String.self)),
        GraphQLField("last_msg_url", type: .scalar(String.self)),
        GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
        GraphQLField("is_blocked", type: .scalar(Bool.self)),
        GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
        self.init(snapshot: ["__typename": "ConversationsListItem", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Conversation ID
      public var conversationId: Int {
        get {
          return snapshot["conversation_id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "conversation_id")
        }
      }

      /// last action on the convesration, example: when a new message added <br>
      /// ############### the conversation last_action wil be updated.
      public var lastAction: Int? {
        get {
          return snapshot["last_action"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_action")
        }
      }

      /// timstamp in milliseconds for last action on conversation.
      public var lastActionId: String? {
        get {
          return snapshot["last_action_id"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_action_id")
        }
      }

      /// Message object returned when a conversation starts with a message
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The other user that is participant in the conversation<br>
      /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
      public var peerUser: PeerUser? {
        get {
          return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
        }
      }

      /// Unix timestamp
      public var timestamp: String {
        get {
          return snapshot["timestamp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }

      /// Unseen messages count in the conversations <br>
      /// ############# This will be changed on every new message and every setSeenConversatin call
      public var unseenCount: Int? {
        get {
          return snapshot["unseen_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "unseen_count")
        }
      }

      /// Text of the last message in conversation (To be used for view purposes on client)
      public var lastMsgText: String? {
        get {
          return snapshot["last_msg_text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_msg_text")
        }
      }

      /// The URL of the last message in conversation
      public var lastMsgUrl: String? {
        get {
          return snapshot["last_msg_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_msg_url")
        }
      }

      /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
      public var lastMsgMType: Int? {
        get {
          return snapshot["last_msg_m_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_msg_m_type")
        }
      }

      /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
      public var isBlocked: Bool? {
        get {
          return snapshot["is_blocked"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "is_blocked")
        }
      }

      /// Indicateds wither the conversation is blocked by the peer user or not
      public var peerIsBlocked: Bool? {
        get {
          return snapshot["peer_is_blocked"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "peer_is_blocked")
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct PeerUser: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("image_last_changed", type: .scalar(String.self)),
          GraphQLField("image_type", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var imageLastChanged: String? {
          get {
            return snapshot["image_last_changed"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image_last_changed")
          }
        }

        public var imageType: String? {
          get {
            return snapshot["image_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image_type")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class GetConversationMessagesQuery: GraphQLQuery {
  public static let operationString =
    "query GetConversationMessages($conversation_id: Int!, $fetch_count: Int!, $start_from: Int, $user_id: Int!) {\n  getConversationMessages(conversation_id: $conversation_id, fetch_count: $fetch_count, start_from: $start_from, user_id: $user_id) {\n    __typename\n    conv_type\n    conversation_id\n    local_id\n    m_type\n    message_id\n    status\n    text\n    timestamp\n    url\n    url_domain\n    url_text\n    thumb_url\n    url_title\n    user_id\n  }\n}"

  public var conversation_id: Int
  public var fetch_count: Int
  public var start_from: Int?
  public var user_id: Int

  public init(conversation_id: Int, fetch_count: Int, start_from: Int? = nil, user_id: Int) {
    self.conversation_id = conversation_id
    self.fetch_count = fetch_count
    self.start_from = start_from
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["conversation_id": conversation_id, "fetch_count": fetch_count, "start_from": start_from, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getConversationMessages", arguments: ["conversation_id": GraphQLVariable("conversation_id"), "fetch_count": GraphQLVariable("fetch_count"), "start_from": GraphQLVariable("start_from"), "user_id": GraphQLVariable("user_id")], type: .list(.object(GetConversationMessage.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getConversationMessages: [GetConversationMessage?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "getConversationMessages": getConversationMessages.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    /// Get messages for the desired conversation in a descencing order
    public var getConversationMessages: [GetConversationMessage?]? {
      get {
        return (snapshot["getConversationMessages"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { GetConversationMessage(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "getConversationMessages")
      }
    }

    public struct GetConversationMessage: GraphQLSelectionSet {
      public static let possibleTypes = ["Message"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("conv_type", type: .scalar(Int.self)),
        GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("local_id", type: .scalar(Int.self)),
        GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
        GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("status", type: .scalar(Int.self)),
        GraphQLField("text", type: .scalar(String.self)),
        GraphQLField("timestamp", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("url_domain", type: .scalar(String.self)),
        GraphQLField("url_text", type: .scalar(String.self)),
        GraphQLField("thumb_url", type: .scalar(String.self)),
        GraphQLField("url_title", type: .scalar(String.self)),
        GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
        self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// n/a
      public var convType: Int? {
        get {
          return snapshot["conv_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "conv_type")
        }
      }

      /// n/a
      public var conversationId: Int {
        get {
          return snapshot["conversation_id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "conversation_id")
        }
      }

      /// Message ID in the local database of the sender client i.e Mobile Application
      public var localId: Int? {
        get {
          return snapshot["local_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "local_id")
        }
      }

      /// Message type Enum values : <br>
      /// ################################# 0 : TEXT <br>
      /// ################################# 1 : VIDEO <br>
      /// ################################# 2 : PICTURE <br>
      /// ################################# 3 : DOCUMENT <br>
      /// ################################# 4 : LINK <br>
      /// ################################# 5 : LINK_YOUTUBE <br>
      /// ################################# 6 : GIF <br>
      /// ################################# 7 : GIF_TENOR <br>
      /// ################################# 8 : AUDIO <br>
      /// ################################# 9 : LOCATION <br>
      public var mType: Int {
        get {
          return snapshot["m_type"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "m_type")
        }
      }

      /// Message ID in the server DB
      public var messageId: Int {
        get {
          return snapshot["message_id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "message_id")
        }
      }

      /// Message status Enum values : <br>
      /// ################################# 0 : SENT <br>
      /// ################################# 1 : SEEN<br>
      public var status: Int? {
        get {
          return snapshot["status"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      /// Message text
      public var text: String? {
        get {
          return snapshot["text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      /// Unix timestamp
      public var timestamp: String? {
        get {
          return snapshot["timestamp"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }

      /// URL of the attachment, link, gif
      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      /// URL preview domain
      public var urlDomain: String? {
        get {
          return snapshot["url_domain"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url_domain")
        }
      }

      /// URL preview text
      public var urlText: String? {
        get {
          return snapshot["url_text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url_text")
        }
      }

      /// URL preview thumb
      public var thumbUrl: String? {
        get {
          return snapshot["thumb_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "thumb_url")
        }
      }

      /// URL preview Title
      public var urlTitle: String? {
        get {
          return snapshot["url_title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url_title")
        }
      }

      /// User ID of the sender
      public var userId: Int {
        get {
          return snapshot["user_id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_id")
        }
      }
    }
  }
}

public final class GetUnseenCountQuery: GraphQLQuery {
  public static let operationString =
    "query GetUnseenCount($user_id: Int!) {\n  getUnseenCount(user_id: $user_id) {\n    __typename\n    count\n    user_id\n  }\n}"

  public var user_id: Int

  public init(user_id: Int) {
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUnseenCount", arguments: ["user_id": GraphQLVariable("user_id")], type: .object(GetUnseenCount.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUnseenCount: GetUnseenCount? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUnseenCount": getUnseenCount.flatMap { $0.snapshot }])
    }

    /// Get the Count of Unseen Messages related for the user
    public var getUnseenCount: GetUnseenCount? {
      get {
        return (snapshot["getUnseenCount"] as? Snapshot).flatMap { GetUnseenCount(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getUnseenCount")
      }
    }

    public struct GetUnseenCount: GraphQLSelectionSet {
      public static let possibleTypes = ["UnseenCount"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("count", type: .nonNull(.scalar(Int.self))),
        GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(count: Int, userId: Int) {
        self.init(snapshot: ["__typename": "UnseenCount", "count": count, "user_id": userId])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var count: Int {
        get {
          return snapshot["count"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "count")
        }
      }

      public var userId: Int {
        get {
          return snapshot["user_id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_id")
        }
      }
    }
  }
}

public final class GetUserConversationsQuery: GraphQLQuery {
  public static let operationString =
    "query GetUserConversations($fetch_count: Int!, $start_from: Int, $user_id: Int) {\n  getUserConversations(fetch_count: $fetch_count, start_from: $start_from, user_id: $user_id) {\n    __typename\n    conversation_id\n    last_action\n    last_action_id\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    peer_user {\n      __typename\n      image_last_changed\n      image_type\n      name\n      user_id\n    }\n    timestamp\n    unseen_count\n    last_msg_text\n    last_msg_url\n    last_msg_m_type\n    is_blocked\n    peer_is_blocked\n  }\n}"

  public var fetch_count: Int
  public var start_from: Int?
  public var user_id: Int?

  public init(fetch_count: Int, start_from: Int? = nil, user_id: Int? = nil) {
    self.fetch_count = fetch_count
    self.start_from = start_from
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["fetch_count": fetch_count, "start_from": start_from, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUserConversations", arguments: ["fetch_count": GraphQLVariable("fetch_count"), "start_from": GraphQLVariable("start_from"), "user_id": GraphQLVariable("user_id")], type: .list(.object(GetUserConversation.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUserConversations: [GetUserConversation?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUserConversations": getUserConversations.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    /// Returns a list of all the conversations that the user is a participant in
    public var getUserConversations: [GetUserConversation?]? {
      get {
        return (snapshot["getUserConversations"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { GetUserConversation(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "getUserConversations")
      }
    }

    public struct GetUserConversation: GraphQLSelectionSet {
      public static let possibleTypes = ["ConversationsListItem"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("last_action", type: .scalar(Int.self)),
        GraphQLField("last_action_id", type: .scalar(String.self)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("peer_user", type: .object(PeerUser.selections)),
        GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
        GraphQLField("unseen_count", type: .scalar(Int.self)),
        GraphQLField("last_msg_text", type: .scalar(String.self)),
        GraphQLField("last_msg_url", type: .scalar(String.self)),
        GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
        GraphQLField("is_blocked", type: .scalar(Bool.self)),
        GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
        self.init(snapshot: ["__typename": "ConversationsListItem", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Conversation ID
      public var conversationId: Int {
        get {
          return snapshot["conversation_id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "conversation_id")
        }
      }

      /// last action on the convesration, example: when a new message added <br>
      /// ############### the conversation last_action wil be updated.
      public var lastAction: Int? {
        get {
          return snapshot["last_action"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_action")
        }
      }

      /// timstamp in milliseconds for last action on conversation.
      public var lastActionId: String? {
        get {
          return snapshot["last_action_id"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_action_id")
        }
      }

      /// Message object returned when a conversation starts with a message
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The other user that is participant in the conversation<br>
      /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
      public var peerUser: PeerUser? {
        get {
          return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
        }
      }

      /// Unix timestamp
      public var timestamp: String {
        get {
          return snapshot["timestamp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }

      /// Unseen messages count in the conversations <br>
      /// ############# This will be changed on every new message and every setSeenConversatin call
      public var unseenCount: Int? {
        get {
          return snapshot["unseen_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "unseen_count")
        }
      }

      /// Text of the last message in conversation (To be used for view purposes on client)
      public var lastMsgText: String? {
        get {
          return snapshot["last_msg_text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_msg_text")
        }
      }

      /// The URL of the last message in conversation
      public var lastMsgUrl: String? {
        get {
          return snapshot["last_msg_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_msg_url")
        }
      }

      /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
      public var lastMsgMType: Int? {
        get {
          return snapshot["last_msg_m_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_msg_m_type")
        }
      }

      /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
      public var isBlocked: Bool? {
        get {
          return snapshot["is_blocked"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "is_blocked")
        }
      }

      /// Indicateds wither the conversation is blocked by the peer user or not
      public var peerIsBlocked: Bool? {
        get {
          return snapshot["peer_is_blocked"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "peer_is_blocked")
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct PeerUser: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("image_last_changed", type: .scalar(String.self)),
          GraphQLField("image_type", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var imageLastChanged: String? {
          get {
            return snapshot["image_last_changed"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image_last_changed")
          }
        }

        public var imageType: String? {
          get {
            return snapshot["image_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image_type")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class GetUserConversationsDepQuery: GraphQLQuery {
  public static let operationString =
    "query GetUserConversationsDep($fetch_count: Int!, $start_from: Int, $user_id: Int) {\n  getUserConversations_dep(fetch_count: $fetch_count, start_from: $start_from, user_id: $user_id) {\n    __typename\n    conversation_id\n    receiver_id\n    sender_id\n  }\n}"

  public var fetch_count: Int
  public var start_from: Int?
  public var user_id: Int?

  public init(fetch_count: Int, start_from: Int? = nil, user_id: Int? = nil) {
    self.fetch_count = fetch_count
    self.start_from = start_from
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["fetch_count": fetch_count, "start_from": start_from, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUserConversations_dep", arguments: ["fetch_count": GraphQLVariable("fetch_count"), "start_from": GraphQLVariable("start_from"), "user_id": GraphQLVariable("user_id")], type: .list(.object(GetUserConversationsDep.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUserConversationsDep: [GetUserConversationsDep?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUserConversations_dep": getUserConversationsDep.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    /// (Deprecated)  Returns a list of all the conversations that the user is a participant in
    public var getUserConversationsDep: [GetUserConversationsDep?]? {
      get {
        return (snapshot["getUserConversations_dep"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { GetUserConversationsDep(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "getUserConversations_dep")
      }
    }

    public struct GetUserConversationsDep: GraphQLSelectionSet {
      public static let possibleTypes = ["Conversation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("conversation_id", type: .scalar(Int.self)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("sender_id", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(conversationId: Int? = nil, receiverId: Int? = nil, senderId: Int? = nil) {
        self.init(snapshot: ["__typename": "Conversation", "conversation_id": conversationId, "receiver_id": receiverId, "sender_id": senderId])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// n/a
      public var conversationId: Int? {
        get {
          return snapshot["conversation_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "conversation_id")
        }
      }

      /// User of the targeted user
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// User ID of the craetor
      public var senderId: Int? {
        get {
          return snapshot["sender_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sender_id")
        }
      }
    }
  }
}

public final class GetUserConversationsV2Query: GraphQLQuery {
  public static let operationString =
    "query GetUserConversationsV2($fetch_count: Int!, $last_action: Int, $user_id: Int) {\n  getUserConversations_v2(fetch_count: $fetch_count, last_action: $last_action, user_id: $user_id) {\n    __typename\n    conversation_id\n    last_action\n    last_action_id\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    peer_user {\n      __typename\n      image_last_changed\n      image_type\n      name\n      user_id\n    }\n    timestamp\n    unseen_count\n    last_msg_text\n    last_msg_url\n    last_msg_m_type\n    is_blocked\n    peer_is_blocked\n  }\n}"

  public var fetch_count: Int
  public var last_action: Int?
  public var user_id: Int?

  public init(fetch_count: Int, last_action: Int? = nil, user_id: Int? = nil) {
    self.fetch_count = fetch_count
    self.last_action = last_action
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["fetch_count": fetch_count, "last_action": last_action, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUserConversations_v2", arguments: ["fetch_count": GraphQLVariable("fetch_count"), "last_action": GraphQLVariable("last_action"), "user_id": GraphQLVariable("user_id")], type: .list(.object(GetUserConversationsV2.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUserConversationsV2: [GetUserConversationsV2?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUserConversations_v2": getUserConversationsV2.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    /// Returns a list of all the conversations that the user is a participant in
    public var getUserConversationsV2: [GetUserConversationsV2?]? {
      get {
        return (snapshot["getUserConversations_v2"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { GetUserConversationsV2(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "getUserConversations_v2")
      }
    }

    public struct GetUserConversationsV2: GraphQLSelectionSet {
      public static let possibleTypes = ["ConversationsListItem"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("last_action", type: .scalar(Int.self)),
        GraphQLField("last_action_id", type: .scalar(String.self)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("peer_user", type: .object(PeerUser.selections)),
        GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
        GraphQLField("unseen_count", type: .scalar(Int.self)),
        GraphQLField("last_msg_text", type: .scalar(String.self)),
        GraphQLField("last_msg_url", type: .scalar(String.self)),
        GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
        GraphQLField("is_blocked", type: .scalar(Bool.self)),
        GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
        self.init(snapshot: ["__typename": "ConversationsListItem", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Conversation ID
      public var conversationId: Int {
        get {
          return snapshot["conversation_id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "conversation_id")
        }
      }

      /// last action on the convesration, example: when a new message added <br>
      /// ############### the conversation last_action wil be updated.
      public var lastAction: Int? {
        get {
          return snapshot["last_action"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_action")
        }
      }

      /// timstamp in milliseconds for last action on conversation.
      public var lastActionId: String? {
        get {
          return snapshot["last_action_id"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_action_id")
        }
      }

      /// Message object returned when a conversation starts with a message
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The other user that is participant in the conversation<br>
      /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
      public var peerUser: PeerUser? {
        get {
          return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
        }
      }

      /// Unix timestamp
      public var timestamp: String {
        get {
          return snapshot["timestamp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }

      /// Unseen messages count in the conversations <br>
      /// ############# This will be changed on every new message and every setSeenConversatin call
      public var unseenCount: Int? {
        get {
          return snapshot["unseen_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "unseen_count")
        }
      }

      /// Text of the last message in conversation (To be used for view purposes on client)
      public var lastMsgText: String? {
        get {
          return snapshot["last_msg_text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_msg_text")
        }
      }

      /// The URL of the last message in conversation
      public var lastMsgUrl: String? {
        get {
          return snapshot["last_msg_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_msg_url")
        }
      }

      /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
      public var lastMsgMType: Int? {
        get {
          return snapshot["last_msg_m_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_msg_m_type")
        }
      }

      /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
      public var isBlocked: Bool? {
        get {
          return snapshot["is_blocked"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "is_blocked")
        }
      }

      /// Indicateds wither the conversation is blocked by the peer user or not
      public var peerIsBlocked: Bool? {
        get {
          return snapshot["peer_is_blocked"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "peer_is_blocked")
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct PeerUser: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("image_last_changed", type: .scalar(String.self)),
          GraphQLField("image_type", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var imageLastChanged: String? {
          get {
            return snapshot["image_last_changed"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image_last_changed")
          }
        }

        public var imageType: String? {
          get {
            return snapshot["image_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image_type")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}

public final class GetUserConversationsV3Query: GraphQLQuery {
  public static let operationString =
    "query GetUserConversationsV3($base_conv: Int, $fetch_count: Int, $next_token: String, $user_id: Int!) {\n  getUserConversations_v3(base_conv: $base_conv, fetch_count: $fetch_count, next_token: $next_token, user_id: $user_id) {\n    __typename\n    conversations {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    next_token\n  }\n}"

  public var base_conv: Int?
  public var fetch_count: Int?
  public var next_token: String?
  public var user_id: Int

  public init(base_conv: Int? = nil, fetch_count: Int? = nil, next_token: String? = nil, user_id: Int) {
    self.base_conv = base_conv
    self.fetch_count = fetch_count
    self.next_token = next_token
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["base_conv": base_conv, "fetch_count": fetch_count, "next_token": next_token, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUserConversations_v3", arguments: ["base_conv": GraphQLVariable("base_conv"), "fetch_count": GraphQLVariable("fetch_count"), "next_token": GraphQLVariable("next_token"), "user_id": GraphQLVariable("user_id")], type: .object(GetUserConversationsV3.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUserConversationsV3: GetUserConversationsV3? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUserConversations_v3": getUserConversationsV3.flatMap { $0.snapshot }])
    }

    /// Returns a list of all the conversations that the user is a participant in
    public var getUserConversationsV3: GetUserConversationsV3? {
      get {
        return (snapshot["getUserConversations_v3"] as? Snapshot).flatMap { GetUserConversationsV3(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getUserConversations_v3")
      }
    }

    public struct GetUserConversationsV3: GraphQLSelectionSet {
      public static let possibleTypes = ["ConversationsList"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("conversations", type: .list(.object(Conversation.selections))),
        GraphQLField("next_token", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(conversations: [Conversation?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ConversationsList", "conversations": conversations.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "next_token": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// returned list of conversations
      public var conversations: [Conversation?]? {
        get {
          return (snapshot["conversations"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Conversation(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "conversations")
        }
      }

      /// use the with getUserConversations_v3 to get the next page of pagination.
      public var nextToken: String? {
        get {
          return snapshot["next_token"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "next_token")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be changed on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }
    }
  }
}

public final class GetUserMessagesQuery: GraphQLQuery {
  public static let operationString =
    "query GetUserMessages($fetch_count: Int!, $start_from: Int, $user_id: Int!) {\n  getUserMessages(fetch_count: $fetch_count, start_from: $start_from, user_id: $user_id) {\n    __typename\n    conv_type\n    conversation_id\n    local_id\n    m_type\n    message_id\n    status\n    text\n    timestamp\n    url\n    url_domain\n    url_text\n    thumb_url\n    url_title\n    user_id\n  }\n}"

  public var fetch_count: Int
  public var start_from: Int?
  public var user_id: Int

  public init(fetch_count: Int, start_from: Int? = nil, user_id: Int) {
    self.fetch_count = fetch_count
    self.start_from = start_from
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["fetch_count": fetch_count, "start_from": start_from, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUserMessages", arguments: ["fetch_count": GraphQLVariable("fetch_count"), "start_from": GraphQLVariable("start_from"), "user_id": GraphQLVariable("user_id")], type: .list(.object(GetUserMessage.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUserMessages: [GetUserMessage?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUserMessages": getUserMessages.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    /// Get messages by User ID <br>
    /// ################################# this query will return all the messages for the user without grouping them by conversation, the will be orderd by ID.
    public var getUserMessages: [GetUserMessage?]? {
      get {
        return (snapshot["getUserMessages"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { GetUserMessage(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "getUserMessages")
      }
    }

    public struct GetUserMessage: GraphQLSelectionSet {
      public static let possibleTypes = ["Message"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("conv_type", type: .scalar(Int.self)),
        GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("local_id", type: .scalar(Int.self)),
        GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
        GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("status", type: .scalar(Int.self)),
        GraphQLField("text", type: .scalar(String.self)),
        GraphQLField("timestamp", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("url_domain", type: .scalar(String.self)),
        GraphQLField("url_text", type: .scalar(String.self)),
        GraphQLField("thumb_url", type: .scalar(String.self)),
        GraphQLField("url_title", type: .scalar(String.self)),
        GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
        self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// n/a
      public var convType: Int? {
        get {
          return snapshot["conv_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "conv_type")
        }
      }

      /// n/a
      public var conversationId: Int {
        get {
          return snapshot["conversation_id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "conversation_id")
        }
      }

      /// Message ID in the local database of the sender client i.e Mobile Application
      public var localId: Int? {
        get {
          return snapshot["local_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "local_id")
        }
      }

      /// Message type Enum values : <br>
      /// ################################# 0 : TEXT <br>
      /// ################################# 1 : VIDEO <br>
      /// ################################# 2 : PICTURE <br>
      /// ################################# 3 : DOCUMENT <br>
      /// ################################# 4 : LINK <br>
      /// ################################# 5 : LINK_YOUTUBE <br>
      /// ################################# 6 : GIF <br>
      /// ################################# 7 : GIF_TENOR <br>
      /// ################################# 8 : AUDIO <br>
      /// ################################# 9 : LOCATION <br>
      public var mType: Int {
        get {
          return snapshot["m_type"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "m_type")
        }
      }

      /// Message ID in the server DB
      public var messageId: Int {
        get {
          return snapshot["message_id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "message_id")
        }
      }

      /// Message status Enum values : <br>
      /// ################################# 0 : SENT <br>
      /// ################################# 1 : SEEN<br>
      public var status: Int? {
        get {
          return snapshot["status"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      /// Message text
      public var text: String? {
        get {
          return snapshot["text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      /// Unix timestamp
      public var timestamp: String? {
        get {
          return snapshot["timestamp"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }

      /// URL of the attachment, link, gif
      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      /// URL preview domain
      public var urlDomain: String? {
        get {
          return snapshot["url_domain"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url_domain")
        }
      }

      /// URL preview text
      public var urlText: String? {
        get {
          return snapshot["url_text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url_text")
        }
      }

      /// URL preview thumb
      public var thumbUrl: String? {
        get {
          return snapshot["thumb_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "thumb_url")
        }
      }

      /// URL preview Title
      public var urlTitle: String? {
        get {
          return snapshot["url_title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url_title")
        }
      }

      /// User ID of the sender
      public var userId: Int {
        get {
          return snapshot["user_id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_id")
        }
      }
    }
  }
}

public final class GetUserOnlineStatusQuery: GraphQLQuery {
  public static let operationString =
    "query GetUserOnlineStatus($user_id: Int!) {\n  getUserOnlineStatus(user_id: $user_id) {\n    __typename\n    is_online\n    last_seen\n  }\n}"

  public var user_id: Int

  public init(user_id: Int) {
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUserOnlineStatus", arguments: ["user_id": GraphQLVariable("user_id")], type: .object(GetUserOnlineStatus.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUserOnlineStatus: GetUserOnlineStatus? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUserOnlineStatus": getUserOnlineStatus.flatMap { $0.snapshot }])
    }

    /// Get wether the user is online or offline
    public var getUserOnlineStatus: GetUserOnlineStatus? {
      get {
        return (snapshot["getUserOnlineStatus"] as? Snapshot).flatMap { GetUserOnlineStatus(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getUserOnlineStatus")
      }
    }

    public struct GetUserOnlineStatus: GraphQLSelectionSet {
      public static let possibleTypes = ["SignalOnlineStatus"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("is_online", type: .scalar(Bool.self)),
        GraphQLField("last_seen", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(isOnline: Bool? = nil, lastSeen: String? = nil) {
        self.init(snapshot: ["__typename": "SignalOnlineStatus", "is_online": isOnline, "last_seen": lastSeen])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Detemines whether the user last_seen is no more 5 seconds past from the time of calling getUserOnlineStatus
      public var isOnline: Bool? {
        get {
          return snapshot["is_online"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "is_online")
        }
      }

      /// Unix timestamp in mille-seconds
      public var lastSeen: String? {
        get {
          return snapshot["last_seen"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_seen")
        }
      }
    }
  }
}

public final class SubscribeByUserIdSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription SubscribeByUserId($receiver_id: Int) {\n  subscribeByUserID(receiver_id: $receiver_id) {\n    __typename\n    action_type\n    conversation {\n      __typename\n      conversation_id\n      last_action\n      last_action_id\n      message {\n        __typename\n        conv_type\n        conversation_id\n        local_id\n        m_type\n        message_id\n        status\n        text\n        timestamp\n        url\n        url_domain\n        url_text\n        thumb_url\n        url_title\n        user_id\n      }\n      peer_user {\n        __typename\n        image_last_changed\n        image_type\n        name\n        user_id\n      }\n      timestamp\n      unseen_count\n      last_msg_text\n      last_msg_url\n      last_msg_m_type\n      is_blocked\n      peer_is_blocked\n    }\n    message {\n      __typename\n      conv_type\n      conversation_id\n      local_id\n      m_type\n      message_id\n      status\n      text\n      timestamp\n      url\n      url_domain\n      url_text\n      thumb_url\n      url_title\n      user_id\n    }\n    receiver_id\n    seen {\n      __typename\n      conversation_id\n      last_msg_seen_id\n    }\n    typing {\n      __typename\n      action\n      conversation_id\n      conversation_type\n      receiver_id\n      user_id\n    }\n  }\n}"

  public var receiver_id: Int?

  public init(receiver_id: Int? = nil) {
    self.receiver_id = receiver_id
  }

  public var variables: GraphQLMap? {
    return ["receiver_id": receiver_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("subscribeByUserID", arguments: ["receiver_id": GraphQLVariable("receiver_id")], type: .object(SubscribeByUserId.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(subscribeByUserId: SubscribeByUserId? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "subscribeByUserID": subscribeByUserId.flatMap { $0.snapshot }])
    }

    /// - This is generic subscription for all actions <br>
    /// ################################# - The cleint will subscribe for this topic and all the actions will be recieved through this channel <br>
    /// ################################# - This subscription will be attached for the following mutations : <br>
    /// #################################   - addMessage <br>
    /// #################################     - publishTyping <br>
    /// #################################   - setSeenConversation <br>
    /// #################################   - newGroupAdded <br>
    /// ################################# - The subscriber will receive a message when someone calls any of the preceeded mutations <br>
    /// ################################# - The "receiver_id" in any of the preceeded mutations should should match the receiver_id(which is your User ID as a subscriber) of this subscription. <br>
    public var subscribeByUserId: SubscribeByUserId? {
      get {
        return (snapshot["subscribeByUserID"] as? Snapshot).flatMap { SubscribeByUserId(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "subscribeByUserID")
      }
    }

    public struct SubscribeByUserId: GraphQLSelectionSet {
      public static let possibleTypes = ["UserIdGenericOutput"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action_type", type: .scalar(Int.self)),
        GraphQLField("conversation", type: .object(Conversation.selections)),
        GraphQLField("message", type: .object(Message.selections)),
        GraphQLField("receiver_id", type: .scalar(Int.self)),
        GraphQLField("seen", type: .object(Seen.selections)),
        GraphQLField("typing", type: .object(Typing.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(actionType: Int? = nil, conversation: Conversation? = nil, message: Message? = nil, receiverId: Int? = nil, seen: Seen? = nil, typing: Typing? = nil) {
        self.init(snapshot: ["__typename": "UserIdGenericOutput", "action_type": actionType, "conversation": conversation.flatMap { $0.snapshot }, "message": message.flatMap { $0.snapshot }, "receiver_id": receiverId, "seen": seen.flatMap { $0.snapshot }, "typing": typing.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// action_type Enum values : <br>
      /// ################################# 0 : NEW_MESSAGE <br>
      /// ################################# 1 : TYPING <br>
      /// ################################# 2 : SEEN <br>
      /// ################################# 3 : NEW_CONVERSATION <br>
      /// ################################# 4 : JOINED_FOR_GROUP_CONVERSATION <br>
      public var actionType: Int? {
        get {
          return snapshot["action_type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "action_type")
        }
      }

      /// New-Conversation in case of action_type = 3
      public var conversation: Conversation? {
        get {
          return (snapshot["conversation"] as? Snapshot).flatMap { Conversation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "conversation")
        }
      }

      /// Message body in case if action_type is 0
      public var message: Message? {
        get {
          return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "message")
        }
      }

      /// The User ID that will receive this output through subscribeByUserID
      public var receiverId: Int? {
        get {
          return snapshot["receiver_id"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "receiver_id")
        }
      }

      /// Seen information in case of action_type = 2
      public var seen: Seen? {
        get {
          return (snapshot["seen"] as? Snapshot).flatMap { Seen(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "seen")
        }
      }

      /// Typing infromation in case if action_type is 1
      public var typing: Typing? {
        get {
          return (snapshot["typing"] as? Snapshot).flatMap { Typing(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "typing")
        }
      }

      public struct Conversation: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationsListItem_startConversation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_action", type: .scalar(Int.self)),
          GraphQLField("last_action_id", type: .scalar(String.self)),
          GraphQLField("message", type: .object(Message.selections)),
          GraphQLField("peer_user", type: .object(PeerUser.selections)),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("unseen_count", type: .scalar(Int.self)),
          GraphQLField("last_msg_text", type: .scalar(String.self)),
          GraphQLField("last_msg_url", type: .scalar(String.self)),
          GraphQLField("last_msg_m_type", type: .scalar(Int.self)),
          GraphQLField("is_blocked", type: .scalar(Bool.self)),
          GraphQLField("peer_is_blocked", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastAction: Int? = nil, lastActionId: String? = nil, message: Message? = nil, peerUser: PeerUser? = nil, timestamp: String, unseenCount: Int? = nil, lastMsgText: String? = nil, lastMsgUrl: String? = nil, lastMsgMType: Int? = nil, isBlocked: Bool? = nil, peerIsBlocked: Bool? = nil) {
          self.init(snapshot: ["__typename": "ConversationsListItem_startConversation", "conversation_id": conversationId, "last_action": lastAction, "last_action_id": lastActionId, "message": message.flatMap { $0.snapshot }, "peer_user": peerUser.flatMap { $0.snapshot }, "timestamp": timestamp, "unseen_count": unseenCount, "last_msg_text": lastMsgText, "last_msg_url": lastMsgUrl, "last_msg_m_type": lastMsgMType, "is_blocked": isBlocked, "peer_is_blocked": peerIsBlocked])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Conversation ID
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// last action on the convesration, example: when a new message added <br>
        /// ############### the conversation last_action wil be updated.
        public var lastAction: Int? {
          get {
            return snapshot["last_action"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action")
          }
        }

        /// timstamp in milliseconds for last action on conversation.
        public var lastActionId: String? {
          get {
            return snapshot["last_action_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_action_id")
          }
        }

        /// Message object returned when a conversation starts with a message
        public var message: Message? {
          get {
            return (snapshot["message"] as? Snapshot).flatMap { Message(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "message")
          }
        }

        /// The other user that is participant in the conversation<br>
        /// ########################## In case It's returend from startConversation or getUserConversation; the peer_user will not be the sender/requests
        public var peerUser: PeerUser? {
          get {
            return (snapshot["peer_user"] as? Snapshot).flatMap { PeerUser(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "peer_user")
          }
        }

        /// Unix timestamp
        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// Unseen messages count in the conversations <br>
        /// ############# This will be chaned on every new message and every setSeenConversatin call
        public var unseenCount: Int? {
          get {
            return snapshot["unseen_count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "unseen_count")
          }
        }

        /// Text of the last message in conversation (To be used for view purposes on client)
        public var lastMsgText: String? {
          get {
            return snapshot["last_msg_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_text")
          }
        }

        /// The URL of the last message in conversation
        public var lastMsgUrl: String? {
          get {
            return snapshot["last_msg_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_url")
          }
        }

        /// The message type of the last message in conversation, this is usefull to show different view for multiple messages types
        public var lastMsgMType: Int? {
          get {
            return snapshot["last_msg_m_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_m_type")
          }
        }

        /// Indicateds wither the conversation is blocked by the user(the performed the request) or not
        public var isBlocked: Bool? {
          get {
            return snapshot["is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_blocked")
          }
        }

        /// Indicateds wither the conversation is blocked by the peer user or not
        public var peerIsBlocked: Bool? {
          get {
            return snapshot["peer_is_blocked"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "peer_is_blocked")
          }
        }

        public struct Message: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("conv_type", type: .scalar(Int.self)),
            GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("local_id", type: .scalar(Int.self)),
            GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("text", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("url_domain", type: .scalar(String.self)),
            GraphQLField("url_text", type: .scalar(String.self)),
            GraphQLField("thumb_url", type: .scalar(String.self)),
            GraphQLField("url_title", type: .scalar(String.self)),
            GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
            self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// n/a
          public var convType: Int? {
            get {
              return snapshot["conv_type"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conv_type")
            }
          }

          /// n/a
          public var conversationId: Int {
            get {
              return snapshot["conversation_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "conversation_id")
            }
          }

          /// Message ID in the local database of the sender client i.e Mobile Application
          public var localId: Int? {
            get {
              return snapshot["local_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "local_id")
            }
          }

          /// Message type Enum values : <br>
          /// ################################# 0 : TEXT <br>
          /// ################################# 1 : VIDEO <br>
          /// ################################# 2 : PICTURE <br>
          /// ################################# 3 : DOCUMENT <br>
          /// ################################# 4 : LINK <br>
          /// ################################# 5 : LINK_YOUTUBE <br>
          /// ################################# 6 : GIF <br>
          /// ################################# 7 : GIF_TENOR <br>
          /// ################################# 8 : AUDIO <br>
          /// ################################# 9 : LOCATION <br>
          public var mType: Int {
            get {
              return snapshot["m_type"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "m_type")
            }
          }

          /// Message ID in the server DB
          public var messageId: Int {
            get {
              return snapshot["message_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "message_id")
            }
          }

          /// Message status Enum values : <br>
          /// ################################# 0 : SENT <br>
          /// ################################# 1 : SEEN<br>
          public var status: Int? {
            get {
              return snapshot["status"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "status")
            }
          }

          /// Message text
          public var text: String? {
            get {
              return snapshot["text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          /// Unix timestamp
          public var timestamp: String? {
            get {
              return snapshot["timestamp"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          /// URL of the attachment, link, gif
          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          /// URL preview domain
          public var urlDomain: String? {
            get {
              return snapshot["url_domain"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_domain")
            }
          }

          /// URL preview text
          public var urlText: String? {
            get {
              return snapshot["url_text"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_text")
            }
          }

          /// URL preview thumb
          public var thumbUrl: String? {
            get {
              return snapshot["thumb_url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "thumb_url")
            }
          }

          /// URL preview Title
          public var urlTitle: String? {
            get {
              return snapshot["url_title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url_title")
            }
          }

          /// User ID of the sender
          public var userId: Int {
            get {
              return snapshot["user_id"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }

        public struct PeerUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image_last_changed", type: .scalar(String.self)),
            GraphQLField("image_type", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(Int.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(imageLastChanged: String? = nil, imageType: String? = nil, name: String? = nil, userId: Int? = nil) {
            self.init(snapshot: ["__typename": "User", "image_last_changed": imageLastChanged, "image_type": imageType, "name": name, "user_id": userId])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imageLastChanged: String? {
            get {
              return snapshot["image_last_changed"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_last_changed")
            }
          }

          public var imageType: String? {
            get {
              return snapshot["image_type"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image_type")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: Int? {
            get {
              return snapshot["user_id"] as? Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_id")
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conv_type", type: .scalar(Int.self)),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("local_id", type: .scalar(Int.self)),
          GraphQLField("m_type", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("url_domain", type: .scalar(String.self)),
          GraphQLField("url_text", type: .scalar(String.self)),
          GraphQLField("thumb_url", type: .scalar(String.self)),
          GraphQLField("url_title", type: .scalar(String.self)),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(convType: Int? = nil, conversationId: Int, localId: Int? = nil, mType: Int, messageId: Int, status: Int? = nil, text: String? = nil, timestamp: String? = nil, url: String? = nil, urlDomain: String? = nil, urlText: String? = nil, thumbUrl: String? = nil, urlTitle: String? = nil, userId: Int) {
          self.init(snapshot: ["__typename": "Message", "conv_type": convType, "conversation_id": conversationId, "local_id": localId, "m_type": mType, "message_id": messageId, "status": status, "text": text, "timestamp": timestamp, "url": url, "url_domain": urlDomain, "url_text": urlText, "thumb_url": thumbUrl, "url_title": urlTitle, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// n/a
        public var convType: Int? {
          get {
            return snapshot["conv_type"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conv_type")
          }
        }

        /// n/a
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID in the local database of the sender client i.e Mobile Application
        public var localId: Int? {
          get {
            return snapshot["local_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "local_id")
          }
        }

        /// Message type Enum values : <br>
        /// ################################# 0 : TEXT <br>
        /// ################################# 1 : VIDEO <br>
        /// ################################# 2 : PICTURE <br>
        /// ################################# 3 : DOCUMENT <br>
        /// ################################# 4 : LINK <br>
        /// ################################# 5 : LINK_YOUTUBE <br>
        /// ################################# 6 : GIF <br>
        /// ################################# 7 : GIF_TENOR <br>
        /// ################################# 8 : AUDIO <br>
        /// ################################# 9 : LOCATION <br>
        public var mType: Int {
          get {
            return snapshot["m_type"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "m_type")
          }
        }

        /// Message ID in the server DB
        public var messageId: Int {
          get {
            return snapshot["message_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "message_id")
          }
        }

        /// Message status Enum values : <br>
        /// ################################# 0 : SENT <br>
        /// ################################# 1 : SEEN<br>
        public var status: Int? {
          get {
            return snapshot["status"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "status")
          }
        }

        /// Message text
        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        /// Unix timestamp
        public var timestamp: String? {
          get {
            return snapshot["timestamp"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        /// URL of the attachment, link, gif
        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        /// URL preview domain
        public var urlDomain: String? {
          get {
            return snapshot["url_domain"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_domain")
          }
        }

        /// URL preview text
        public var urlText: String? {
          get {
            return snapshot["url_text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_text")
          }
        }

        /// URL preview thumb
        public var thumbUrl: String? {
          get {
            return snapshot["thumb_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "thumb_url")
          }
        }

        /// URL preview Title
        public var urlTitle: String? {
          get {
            return snapshot["url_title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url_title")
          }
        }

        /// User ID of the sender
        public var userId: Int {
          get {
            return snapshot["user_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }

      public struct Seen: GraphQLSelectionSet {
        public static let possibleTypes = ["SeenOutput"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("last_msg_seen_id", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(conversationId: Int, lastMsgSeenId: Int) {
          self.init(snapshot: ["__typename": "SeenOutput", "conversation_id": conversationId, "last_msg_seen_id": lastMsgSeenId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The conversation which the other client marked as seen
        public var conversationId: Int {
          get {
            return snapshot["conversation_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        /// Message ID of the last seen message on the other client
        public var lastMsgSeenId: Int {
          get {
            return snapshot["last_msg_seen_id"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_msg_seen_id")
          }
        }
      }

      public struct Typing: GraphQLSelectionSet {
        public static let possibleTypes = ["TypingCommiter"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .nonNull(.scalar(Int.self))),
          GraphQLField("conversation_id", type: .scalar(Int.self)),
          GraphQLField("conversation_type", type: .scalar(String.self)),
          GraphQLField("receiver_id", type: .scalar(Int.self)),
          GraphQLField("user_id", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(action: Int, conversationId: Int? = nil, conversationType: String? = nil, receiverId: Int? = nil, userId: Int? = nil) {
          self.init(snapshot: ["__typename": "TypingCommiter", "action": action, "conversation_id": conversationId, "conversation_type": conversationType, "receiver_id": receiverId, "user_id": userId])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Action Enum values : <br>
        /// ################################# 0 : START_TYPING <br>
        /// ################################# 1 : STOP_TYPING
        public var action: Int {
          get {
            return snapshot["action"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "action")
          }
        }

        /// Conversation ID that the typing happened within
        public var conversationId: Int? {
          get {
            return snapshot["conversation_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_id")
          }
        }

        public var conversationType: String? {
          get {
            return snapshot["conversation_type"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversation_type")
          }
        }

        public var receiverId: Int? {
          get {
            return snapshot["receiver_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "receiver_id")
          }
        }

        /// User ID that committed the typing action
        public var userId: Int? {
          get {
            return snapshot["user_id"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_id")
          }
        }
      }
    }
  }
}