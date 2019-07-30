//
//  ActionTypes.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 4/17/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation

/// action type :
/// 0 : NEW_MESSAGE <br>
/// 1 : TYPING <br>
/// 2 : SEEN <br>
/// 5 : JOINED_FOR_GROUP_CONVERSATION <br>
enum MessageActionTypes: Int {
  
    case newMessage = 0
    case typing = 1
    case seen = 2
    case joinedForGroupConversation = 5
}
