//
//  MediaModel.swift
//  NetworkingRetrier
//
//  Created by Mohammad Alhaj on 4/23/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import MessageKit
import Kingfisher

struct MediaModel: MediaItem {
    var url: URL?
    
    var image: UIImage?
    
    var placeholderImage: UIImage
    
    var size: CGSize
     
}
