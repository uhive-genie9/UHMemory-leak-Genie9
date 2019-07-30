//
//  LinkPreviewCell.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 5/15/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import UIKit
import MessageKit

protocol LinkPreviewCellDelegate: MessageCellDelegate {
    func didTappURL(_ cell: LinkPreviewCell)
}

class LinkPreviewCell: UICollectionViewCell {
    
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var detemineSenderStackView: UIStackView!
    
    weak var linkPreviewCellDelegate: LinkPreviewCellDelegate?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //dont forget to nil every attribute related to cell

        linkLabel.text = nil
        linkPreviewCellDelegate = nil
    }

    func configure(with message: MessageType, at indexPath: IndexPath, and messagesCollectionView: MessagesCollectionView) {
        
        if let delegate = messagesCollectionView.messageCellDelegate as? LinkPreviewCellDelegate {
            self.linkPreviewCellDelegate = delegate
        }
        linkLabel.textAlignment = messagesCollectionView.messagesDataSource?.isFromCurrentSender(message: message) ?? false ? .right : .left
        detemineSenderStackView.alignment = messagesCollectionView.messagesDataSource?.isFromCurrentSender(message: message) ?? false ?  UIStackView.Alignment.trailing : UIStackView.Alignment.leading
        
        switch message.kind {
        case .custom(let data):
            guard let linkModel = data as? LinkModel else { return }
            thumbnailImageView.setImage(imageUrl: linkModel.thumbnail, contentMode: .scaleToFill)
            linkLabel.text = linkModel.description
        default:
            break
        }
        
        
        
    }
    
    @IBAction func didTappURL(sender: UIButton) {
        linkPreviewCellDelegate?.didTappURL(self)
    }
    
}

extension LinkPreviewCell: MessagesLayoutDelegate {
    
    func customCellSizeCalculator(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CellSizeCalculator {
        return CustomMessageSizeCalculator()
    }
}

open class MyCustomMessagesFlowLayout: MessagesCollectionViewFlowLayout {
    lazy open var customMessageSizeCalculator = CustomMessageSizeCalculator(layout: self)
    
    override open func cellSizeCalculatorForItem(at indexPath: IndexPath) -> CellSizeCalculator {
        let message = messagesDataSource.messageForItem(at: indexPath, in: messagesCollectionView)
        if case .custom = message.kind {
            return customMessageSizeCalculator
        }
        return super.cellSizeCalculatorForItem(at: indexPath);
    }
}

open class CustomMessageSizeCalculator: MessageSizeCalculator {
    open override func messageContainerSize(for message: MessageType) -> CGSize {
        //TODO - Customize to size your content appropriately. This just returns a constant size.
        return CGSize(width: 10, height: 100)
    }
}
