//
//  GIFCategoriesCell.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 6/20/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import UIKit

class GIFCategoriesCell: UICollectionViewCell, Cellable {
    @IBOutlet weak var categoryLabel: UILabel!
    
    func configure(_ object: Configurable?) {
        if let obj = object as? GIFCategoryItem {
                categoryLabel.text = obj.item
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 15
    }
    
    func setSelectedUI(_ selected: Bool) {
        contentView.backgroundColor = selected ? .lightGray : .groupTableViewBackground
        categoryLabel.textColor = selected ? .darkGray : .lightGray
    }

  
    override var isSelected: Bool {
        willSet {
           setSelectedUI(newValue)
        }
    }
 
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
       
      
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
  
}
