//
//  UIViewControllerExtensions.swift
//  NetworkingRetrier
//
//  Created by Mohammad Alhaj on 4/23/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}

extension String {
    
    func isValidURL() -> Bool {
        guard !contains("..") else { return false }
        
        let head     = "((http|https)://)?([(w|W)]{3}+\\.)?"
        let tail     = "\\.+[A-Za-z]{2,3}+(\\.)?+(/(.)*)?"
        let urlRegEx = head+"+(.)+"+tail
        
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        return urlTest.evaluate(with: trimmingCharacters(in: .whitespaces))
    }
}

extension UIImageView {
    
    func setImage(imageUrl : String?, contentMode: UIImageView.ContentMode) {
        guard let url = URL(string: imageUrl ?? "") else {return}
        let resource = ImageResource(downloadURL: url, cacheKey: imageUrl)
        self.contentMode = contentMode
        
        self.kf.setImage(with: resource, placeholder: nil, options: [ .alsoPrefetchToMemory], progressBlock: nil) {[weak self] (result) in
            switch result {
            case .success(let data):
                self?.image = data.image
            case .failure(let _):
//                print(error)
                break
            }
        }
    }
}
