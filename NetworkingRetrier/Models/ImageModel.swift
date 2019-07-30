//
//  ImageModel.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 4/17/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ImageModel: Codable {
    var fileName: String?
    var url: String?
    var path: String?
    var imageV: UIImageView {
        let imageView = UIImageView()
        imageView.kf.setImage(with: URL(string: url ?? ""))
        return imageView
    }
    enum codingKeys: String, CodingKey {
        case fileName = "file_name", url, path
    }
}
