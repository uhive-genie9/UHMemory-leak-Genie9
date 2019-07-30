//
//  ChatViewController.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 4/2/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import Photos
import Kingfisher

class ChatViewController: MessagesViewController,
    UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UITextViewDelegate {
    
    private var pickedImage: UIImage?
    private var refreshControl = UIRefreshControl()
    weak var conversationsControllerDelegate: ConversationsControllerDelegate?
    private var presenter: BiConversationPresenter!
    private var keyBoardButton: InputBarButtonItem!
    private var gifButton: InputBarButtonItem!
    private var height: CGFloat = 0.0
    //    lazy var gifView = GIFView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height))
    let gifView = GIFView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        presenter = BiConversationPresenter(ChatService(), userService: UserService())
        presenter.getUserOnlineStatus()
        configureMessageCollectionView()
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            height = keyboardRectangle.height
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        presenter.attachView(view: self)
        //here make sure to setSeenlastMessage
        presenter.setLastMessageReceivedSeen()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        messagesCollectionView.scrollToBottom(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.detachView()
        conversationsControllerDelegate?.UpdateConversationUI()
    }
    
    func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return true
    }
    
    
    fileprivate func configureMessageCollectionView() {
        configureMessageCollectionViewLayout()
        messagesCollectionView.register(UINib(nibName: "\(LinkPreviewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(LinkPreviewCell.self)")
        messagesCollectionView.alwaysBounceVertical = true
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messageCellDelegate = self
        
        messageInputBar.inputTextView.delegate = self
        messageInputBar.delegate = self
        configureInputBar()
        refreshControl.addTarget(presenter, action: #selector(presenter.loadMoreMessages), for: .valueChanged)
        messagesCollectionView.refreshControl = refreshControl
        
    }
    
    //    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    //        var visibleRect = CGRect()
    //
    //        visibleRect.origin = self.messagesCollectionView.contentOffset
    //        visibleRect.size = self.messagesCollectionView.bounds.size
    //        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
    //
    //        guard let indexPath = self.messagesCollectionView.indexPathForItem(at: visiblePoint) else { return }
    //
    ////        if indexPath.section == 3 {
    ////            presenter.loadMoreMessages()
    ////        }
    //    }
    
    private func configureMessageCollectionViewLayout() {
        let outgoingAvatarOverlap: CGFloat = 17.5
        messagesCollectionView.collectionViewLayout = MyCustomMessagesFlowLayout()
        
        let layout = messagesCollectionView.collectionViewLayout as? MyCustomMessagesFlowLayout
        layout?.sectionInset = UIEdgeInsets(top: 5, left: 8, bottom: 1, right: 8)
        
        // Hide the outgoing avatar and adjust the label alignment to line up with the messages
        layout?.setMessageOutgoingAvatarSize(.zero)
        layout?.setMessageOutgoingMessageTopLabelAlignment(LabelAlignment(textAlignment: .right, textInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)))
        layout?.setMessageOutgoingMessageBottomLabelAlignment(LabelAlignment(textAlignment: .right, textInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)))
        layout?.setMessageOutgoingAccessoryViewSize(CGSize(width: 10, height: 10))
        layout?.setMessageOutgoingAccessoryViewPadding(HorizontalEdgeInsets(left: 0, right: 0))
        layout?.setMessageOutgoingAccessoryViewPosition(.messageBottom)
        layout?.setMessageOutgoingCellBottomLabelAlignment(LabelAlignment(textAlignment: .right, textInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)))
        
        layout?.setMessageIncomingMessageBottomLabelAlignment(LabelAlignment(textAlignment: .justified, textInsets: UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0)))
        // Set outgoing avatar to overlap with the message bubble
        layout?.setMessageIncomingMessageTopLabelAlignment(LabelAlignment(textAlignment: .left, textInsets: UIEdgeInsets(top: 0, left: 35, bottom: outgoingAvatarOverlap, right: 0)))
        layout?.setMessageIncomingCellBottomLabelAlignment(LabelAlignment(textAlignment: .left, textInsets: UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0)))
        
        layout?.setMessageIncomingAvatarSize(CGSize(width: 30, height: 30))
        layout?.setMessageIncomingMessagePadding(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 18))
        layout?.setMessageIncomingAccessoryViewSize(.zero)
        
    }
    
    fileprivate func presentImagePicker() {
        PHPhotoLibrary.requestAuthorization({ (status) in
            switch status {
            case .authorized:
                if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.sourceType = .photoLibrary
                    imagePicker.allowsEditing = false
                    
                    self.present(imagePicker, animated: true, completion: nil)
                }
            default: break
            }
        })
    }
    
    func placeTextViewButtons() {
        let hStack = UIStackView(arrangedSubviews: [gifButton, keyBoardButton])
        hStack.alignment = .center
        hStack.distribution = .fillProportionally
        hStack.axis = .horizontal
        messageInputBar.inputTextView.addSubview(hStack)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.centerYAnchor.constraint(equalTo: messageInputBar.inputTextView.centerYAnchor, constant: 0).isActive = true
        hStack.rightAnchor.constraint(equalTo: messageInputBar.sendButton.leftAnchor, constant: 0).isActive = true
        keyBoardButton.isHidden = true
    }
    
    
    
    
    private func configureInputBar() {
        
        messageInputBar.inputTextView.isImagePasteEnabled = true
        messageInputBar.isTranslucent = true
        messageInputBar.separatorLine.isHidden = true
        messageInputBar.inputTextView.tintColor = .blue
        messageInputBar.inputTextView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        messageInputBar.inputTextView.placeholderTextColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        messageInputBar.inputTextView.textContainerInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 36)
        messageInputBar.inputTextView.placeholderLabelInsets = UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 36)
        messageInputBar.inputTextView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        messageInputBar.inputTextView.layer.borderWidth = 1.0
        messageInputBar.inputTextView.layer.cornerRadius = 16.0
        messageInputBar.inputTextView.layer.masksToBounds = true
        messageInputBar.inputTextView.scrollIndicatorInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        
  
        
        let openGallaryButton = makeButton(withImage: "ic_gallery", title: "")// set it to an image name
        openGallaryButton.configure {
            $0.contentHorizontalAlignment = .left
            $0.setTitleColor(UIColor(white: 0.6, alpha: 1), for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
            $0.setSize(CGSize(width: 50, height: 25), animated: true)
        }
        openGallaryButton.onTouchUpInside{ _ in
            self.presentImagePicker()
        }
        
        keyBoardButton = makeButton(withImage: "ic_keyboard", title: "")
        keyBoardButton.configure{
            
            $0.contentHorizontalAlignment = .left
            $0.setTitleColor(UIColor(white: 0.6, alpha: 1), for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
            $0.setSize(CGSize(width: 50, height: 25), animated: true)
       
        }
        keyBoardButton.onTouchUpInside{ [weak self] _ in
            self?.keyBoardButton.isHidden = true
            self?.gifButton.isHidden = false
            self?.messageInputBar.inputTextView.resignFirstResponder()
            self?.messageInputBar.inputTextView.inputView = nil
            self?.messageInputBar.inputTextView.becomeFirstResponder()
        }
        
        gifButton = makeButton(withImage: "ic_smiley", title: "")
        gifButton.configure {
            $0.contentHorizontalAlignment = .left
            $0.setTitleColor(UIColor(white: 0.6, alpha: 1), for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
            $0.setSize(CGSize(width: 50, height: 25), animated: true)
        }
        
        gifButton.onTouchUpInside{ [weak self]_ in
            if (self?.messageInputBar.inputTextView.inputView as? GIFView) == nil {
                self?.gifButton.isHidden = true
                self?.keyBoardButton.isHidden = false
                self?.messageInputBar.inputTextView.resignFirstResponder()
                self?.messageInputBar.inputTextView.inputView = self?.gifView
                self?.messageInputBar.inputTextView.becomeFirstResponder()
            }
        }
        
        placeTextViewButtons()
        messageInputBar.leftStackView.translatesAutoresizingMaskIntoConstraints = false
        messageInputBar.setLeftStackViewWidthConstant(to: 35, animated: false)
        messageInputBar.leftStackView.centerYAnchor.constraint(equalTo: messageInputBar.centerYAnchor, constant: 0).isActive = true
        
        messageInputBar.setStackViewItems([openGallaryButton, .flexibleSpace], forStack: .left, animated: false)
        
    }
    
    func isLastSectionVisible() -> Bool {
        
        return messagesCollectionView.indexPathsForVisibleItems.contains(presenter.getLastIndexPath())
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        //        let attachment = NSTextAttachment()
        //        attachment.image = pickedImage
        //        attachment.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        //        let attString = NSAttributedString(attachment: attachment)
        //        messageInputBar.inputTextView.attributedText = attString
        //        messageInputBar.inputTextView.font = UIFont.systemFont(ofSize: 16)
        picker.dismiss(animated: true) {[weak self] in
            self?.presenter.sendImage(image: image)
        }
        
    }
    
    
    private func makeButton(withImage: String, title: String) -> InputBarButtonItem {
        return InputBarButtonItem()
            .configure {
                $0.title = title
                $0.spacing = .fixed(10)
                $0.image = UIImage(named: withImage)?.withRenderingMode(.alwaysTemplate)
                $0.setSize(CGSize(width: 25, height: 25), animated: false)
                $0.tintColor = UIColor(white: 0.8, alpha: 1)
            }.onSelected {
                $0.tintColor = .blue
            }.onDeselected {
                $0.tintColor = UIColor(white: 0.8, alpha: 1)
            }.onTouchUpInside {[weak self] in
                
                let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                actionSheet.addAction(action)
                if let popoverPresentationController = actionSheet.popoverPresentationController {
                    popoverPresentationController.sourceView = $0
                    popoverPresentationController.sourceRect = $0.frame
                }
                self?.navigationController?.present(actionSheet, animated: true, completion: nil)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let messagesDataSource = messagesCollectionView.messagesDataSource else {
            fatalError("Ouch. nil data source for messages")
        }
        
        let message = messagesDataSource.messageForItem(at: indexPath, in: messagesCollectionView)
        if case .custom = message.kind {
            let cell = messagesCollectionView.dequeueReusableCell(LinkPreviewCell.self, for: indexPath)
            cell.configure(with: message, at: indexPath, and: messagesCollectionView)
            return cell
        }
        return super.collectionView(collectionView, cellForItemAt: indexPath)
    }
}

extension ChatViewController: MessageLabelDelegate {
    func didSelectAddress(_ addressComponents: [String: String]) {
        print("Address Selected: \(addressComponents)")
    }
    
    func didSelectDate(_ date: Date) {
        print("Date Selected: \(date)")
    }
    
    func didSelectPhoneNumber(_ phoneNumber: String) {
        print("Phone Number Selected: \(phoneNumber)")
    }
    
    func didSelectURL(_ url: URL) {
        print("URL Selected: \(url)")
    }
    
    func didSelectTransitInformation(_ transitInformation: [String: String]) {
        print("TransitInformation Selected: \(transitInformation)")
    }
}
extension ChatViewController: LinkPreviewCellDelegate {
    func didTappURL(_ cell: LinkPreviewCell) {
        guard let indexPath = messagesCollectionView.indexPath(for: cell) else {return}
        presenter.openURL(at: indexPath)
    }
}

extension ChatViewController: MessageCellDelegate {
    func didTapAvatar(in cell: MessageCollectionViewCell) {
        print("Avatar tapped")
    }
    
    func didTapMessage(in cell: MessageCollectionViewCell) {
        print("Message tapped")
    }
    
    func didTapCellTopLabel(in cell: MessageCollectionViewCell) {
        print("Top cell label tapped")
    }
    
    func didTapMessageTopLabel(in cell: MessageCollectionViewCell) {
        print("Top message label tapped")
    }
    
    func didTapMessageBottomLabel(in cell: MessageCollectionViewCell) {
        print("Bottom label tapped")
    }
    
    func didTapAccessoryView(in cell: MessageCollectionViewCell) {
        print("Accessory view tapped")
    }
    
 
}

extension ChatViewController: InputBarAccessoryViewDelegate {
  
    func handleTextViewButtons() {// string contains non-whitespace characters
        if !messageInputBar.inputTextView.text.trimmingCharacters(in: .whitespaces).isEmpty {
            keyBoardButton.isHidden = true
            gifButton.isHidden = true
        } else {
            gifButton.isHidden = false
        }
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        inputBar.sendButton.isEnabled = false
        presenter.sendTextMessage(text: text)
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, textViewTextDidChangeTo text: String) {
        handleTextViewButtons()
        guard text != "" else {return}
        presenter.startTypingTimer()
    }
}

extension ChatViewController: MessagesDisplayDelegate, MessagesLayoutDelegate {
    
    func customCellSizeCalculator(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CellSizeCalculator {
        return CustomMessageSizeCalculator(layout: MyCustomMessagesFlowLayout())
    }
    
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        
        guard let dataSource = messagesCollectionView.messagesDataSource else { return .bubble }
        return dataSource.isFromCurrentSender(message: message) ? MessageStyle.bubbleTail(.bottomRight, .pointedEdge) : MessageStyle.bubbleTail(.bottomLeft, .pointedEdge)
    }
    
    func configureAccessoryView(_ accessoryView: UIView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        guard let dataSource = messagesCollectionView.messagesDataSource, let messageModel = message as? MessageModel else { return }
        
        accessoryView.subviews.forEach{$0.removeFromSuperview()}
        
        let sentImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        sentImageView.image = #imageLiteral(resourceName: "ic_oneTick")
        sentImageView.contentMode = .scaleToFill
        
        let deliveredImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        deliveredImageView.image = #imageLiteral(resourceName: "ic_doubleTick")
        deliveredImageView.contentMode = .scaleToFill
        
        let seenImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        seenImageView.image = #imageLiteral(resourceName: "ic_doubleTick").withRenderingMode(.alwaysTemplate)
        seenImageView.tintColor = UIColor.blue
        seenImageView.contentMode = .scaleToFill
        
        
        if dataSource.isFromCurrentSender(message: messageModel) {
            switch messageModel.status {
            case .seen?:
                accessoryView.insertSubview(seenImageView, at: 0)
            case .sent?:
                accessoryView.insertSubview(sentImageView, at: 0)
            case .none:
                break
            }
        }
    }
    
    func configureMediaMessageImageView(_ imageView: UIImageView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        guard let model = message as? MessageModel else {return}
        let baseDomain = "https://d291jtucvk86d1.cloudfront.net/"
        let dimension = "?d=250x250"
        let url = String(format: "%@%@%@", baseDomain, model.url ?? "", dimension)
        imageView.kf.setImage(with: URL(string: url))
    }
    
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        //        avatarView.initials = message.sender.displayName
        //        guard let dataSource = messagesCollectionView.messagesDataSource else {return}
        //        avatarView.image = dataSource.isFromCurrentSender(message: message) ? nil : #imageLiteral(resourceName: "IMG_2583")
        avatarView.image = nil
        //        avatarView.image = message.sender.senderId.elementsEqual(String(senderId)) ? nil : nil
    }
    
    func enabledDetectors(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> [DetectorType] {
        return [.url,.date, .phoneNumber, .address]
    }
    
    func detectorAttributes(for detector: DetectorType, and message: MessageType, at indexPath: IndexPath) -> [NSAttributedString.Key: Any] {
        return [NSAttributedString.Key.foregroundColor: UIColor.red]
    }
    
    func typingIndicatorViewSize(in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return CGSize(width: 30, height: 30)
    }
    
    
    func typingIndicatorViewTopInset(in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
    
    func cellBottomLabelAlignment(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> LabelAlignment {
        return LabelAlignment.init(textAlignment: .right, textInsets: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
    }
    
    func cellBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 10
    }
    
    func messageBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 10.0
    }
    
}

extension ChatViewController: MessagesDataSource {
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        if messagesCollectionView.isSectionReservedForTypingIndicator(indexPath.section) {
            return presenter.getTypingIndecator(for: indexPath)
        }
        
        return presenter.getMessageItem(for: indexPath)
    }
    
    func currentSender() -> SenderType {
        return Sender(id: "\(presenter.getSenderId())", displayName: "\(presenter.getSenderId())")
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return presenter.messageListCount()
    }
    
    func messageBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let message = message as? MessageModel
        return NSAttributedString(string: MessageKitDateFormatter.shared.formattedSentDate(timeStamp: message?.timeStamp ?? 0), attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 8), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
    }
    
}

extension ChatViewController: BiConversationView {
    
    func setUserStatus(status: String) {
        navigationItem.title = status
    }
    
    func setSeenMutation(_ lastMessageInChat: MessageModel?) {
        
        guard let dataSource = messagesCollectionView.messagesDataSource,
            let latestMessage = lastMessageInChat else { return }
        !dataSource.isFromCurrentSender(message: latestMessage) ? //if last message is not from the current sender set seen
            presenter.setMessageSeen() : print("s")
    }
    
    func didSendMessage() {
        messageInputBar.inputTextView.text = ""
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToBottom(animated: true)
    }
    
    func didReceiveTextMessage() {
        messagesCollectionView.reloadDataAndKeepOffset()
    }
    
    func didReceiveUserMessages() {
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToBottom(animated: true)
    }
    
    func didReceiveImageMessage() {
        messagesCollectionView.reloadDataAndKeepOffset()
    }
    
    
    //func to check the user if the current sender and if yes setSeenMutation
    func didReceiveTyping(action: TypingAction) {
        switch action {
        case .on:
            setTypingIndicatorViewHidden(false, animated: true, completion: {[weak self] success in
                if success, self?.isLastSectionVisible() == true {
                    self?.messagesCollectionView.reloadData()
                    self?.messagesCollectionView.scrollToBottom(animated: true)
                    
                }
            })
        case .off:
            setTypingIndicatorViewHidden(true, animated: false)
            messagesCollectionView.reloadData()
            messagesCollectionView.scrollToBottom(animated: true)
            
        }
        
    }
    
    func didReceiveSeen() {
        messagesCollectionView.reloadData()
    }
    
    func didReceiveDelivered() {
        messagesCollectionView.reloadData()
    }
    
    func didReceiveConversationMessages() {
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToBottom(animated: false)
    }
    
    func didFinishLoadingMore() {
        messagesCollectionView.reloadDataAndKeepOffset()
        refreshControl.endRefreshing()
        
    }
    
}

