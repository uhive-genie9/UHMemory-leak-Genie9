//
//  ConversationsController.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 5/6/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import UIKit

protocol ConversationsControllerDelegate: class {
    func UpdateConversationUI()
}

class ConversationsController: UIViewController {
    
    @IBOutlet weak var conversationsTableView: UITableView!
    private var presenter: ConversationListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conversationsTableView.tableFooterView = UIView()
        conversationsTableView.dataSource = self
        conversationsTableView.delegate = self
        presenter = ConversationListPresenter(ChatService())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.attachView(self)
       //presenter?.assembleConversationList()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.detachView()
    }
    
    @IBAction func newConversationTapped(_ sender: UIBarButtonItem) {
      //  presenter?.startNewConversation(with: receiverId)
    }
    
}

extension ConversationsController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.returnConversationsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ConversationCell.self)", for: indexPath) as! Cellable & UITableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
    
}

extension ConversationsController: ConversationListView {
    func setSucceeded() {
        conversationsTableView.reloadData()
    }
    
    func didCreateConversation() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChatViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ConversationsController: ConversationsControllerDelegate {
    func UpdateConversationUI() {
        presenter?.assembleConversationList()
    }
}
