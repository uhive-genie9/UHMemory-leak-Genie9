//
//  MsgTypes.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 4/15/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation

enum MsgType: Int, Codable {
    /*
     0 : TEXT
     1 : VIDEO
     2 : PICTURE
     3 : DOCUMENT
     4 : LINK
     5 : GIF
     6 : GIF_TENOR
     7 : AUDIO
     8 : LOCATION
     
     /// Message type Enum values : <br>
     /// 0 : TEXT <br>
     /// 1 : VIDEO <br>
     /// 2 : PICTURE <br>
     /// 3 : DOCUMENT <br>
     /// 4 : LINK <br>
     /// 5 : LINK_YOUTUBE <br>
     /// 6 : GIF <br>
     /// 7 : GIF_TENOR <br>
     /// 8 : AUDIO <br>
     /// 9 : LOCATION <br>
     */
    
    case text = 0
    case video = 1
    case image = 2
    case document = 3
    case link = 4
    case youtube = 5
    case gif = 6
    case gifTenor = 7
    case audio = 8
    case location = 9
    
    init(_ value: MsgType) {
        switch value {
            
        case .text:
            self = .text
        case .video:
            self = .video
        case .image:
            self = .image
        case .document:
            self = .document
        case .link:
            self = .link
        case .youtube:
            self = .youtube
        case .location:
            self = .location
        case .audio:
            self = .audio
        case .gif:
            self = .gif
        case .gifTenor:
            self = .gifTenor
      
        }
    }
}
