//
//  ConversationCell.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 5/6/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import UIKit
class ConversationCell: UITableViewCell, Cellable {
    
    
    @IBOutlet weak var chatImageView: UIImageView!
    @IBOutlet weak var chatTitleLabel: UILabel!
    @IBOutlet weak var chatMessageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(_ object: Configurable?) {
        if let conversationModel = object as? ConversationModel {
            chatImageView.layer.cornerRadius = 29
            chatMessageLabel.text = (conversationModel.message?.url?.isEmpty ?? true) ? conversationModel.message?.text : "media"
            chatTitleLabel.text = "\(conversationModel.peerUser?.name ?? "")"
            dateLabel.text = "\(MessageKitDateFormatter.shared.formattedSentDate(timeStamp: conversationModel.message?.timestamp ?? 0))"
        }
    }
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
        selectionStyle = .none
    }
    
}
