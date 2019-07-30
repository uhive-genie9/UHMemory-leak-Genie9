//
//  LinkModel.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 5/15/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import UIKit
import MessageKit
import SwiftLinkPreview

class LinkModel: Codable {
    var url: String?
    var title: String?
    var description: String?
    var thumbnail: String?

    init(url: String?, title: String?, description: String?, thumbnail: String?) {
        self.thumbnail = thumbnail
        self.url = url
        self.title = title
        self.description = description
    }
    
    enum CodingKeys: String ,CodingKey {
        case url = "finalUrl",
        title,
        description,
        thumbnail = "image"
    }
}
