//
//  GIFKeyboardCell.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 6/20/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class GIFKeyboardCell: UICollectionViewCell, Cellable {
    @IBOutlet weak var GIFImageView: UIImageView!
    
    func configure(_ object: Configurable?) {
        if let gif = object as? GIFItemModel {
            GIFImageView.setImage(imageUrl: gif.media[0].gif.url, contentMode: .redraw)
        }
    }
}

