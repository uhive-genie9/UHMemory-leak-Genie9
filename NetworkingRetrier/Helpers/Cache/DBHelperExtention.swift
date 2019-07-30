//
//  Cach.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 5/22/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation

extension DBHelper {
    //SELECT * FROM Messages WHERE conversation_id = 29
    // MARK: - add Object/s Database
    
    func saveConversations(_ conversations: [ConversationModel]) {
        self.bulkSave(conversations)
    }
    
    func saveConversation(_ conversation: ConversationModel) {
        self.save(conversation)
    }
    
    func saveGIFCategories(_ categories: [GIFCategoryItem]) {
        self.bulkSave(categories)
    }
    
    func saveMessages(_ messages: [MessageModel]) {
        self.bulkSave(messages)
    }
    
    func saveMessage(_ message: MessageModel) {
        self.save(message)
    }
    
    // MARK: - Get from database
    func getGIFCategories() -> [GIFCategoryItem]? {
        return select(GIFCategoryItem.self)
    }
    
    func getConversations() -> [ConversationModel]? {
        return select(ConversationModel.self)
    }
    
    func getMessages(_ conversationId: Int) -> [MessageModel] {
        return selectByOrder(MessageModel.self, orderCommand: "timestamp", order: .asc, filterCommand: "conversation_id = ?", args: [conversationId]) ?? []
    }
    
    func getLatestMessage() -> MessageModel? {
        return singleSelectLast(MessageModel.self)
    }
    
    func deleteUserConversations(){
        DBHelper.shared.deleteAll(ConversationModel.self)
    }
    
    func isEmptyConversations() -> Bool?{
        return DBHelper.shared.isEmpty(ConversationModel.self)
    }
    func getLastConversations() -> Int? {
        return  DBHelper.shared.selectFetchOne(filterCommand: "SELECT MAX(last_action_id) FROM Conversations")
    }
    
    // MARK: - Create Tables
    
    private func createConversationTable(){
        DBHelper.shared.create(TableName.conversation.rawValue) { (tbl) in
            tbl.column("conversation_id", .integer).primaryKey()
            tbl.column("last_action", .integer)
            tbl.column("last_action_id", .integer)
            tbl.column("unseen_count", .integer)
            tbl.column("peer_user", .blob)
            tbl.column("timestamp", .integer)
            tbl.column("message", .integer)
        }
    }
    
    private func createMessagesTable() {
        
        self.create(TableName.message.rawValue) { tbl in
            
            tbl.column("local_id", .integer).primaryKey()
            tbl.column("message_id", .integer)
            tbl.column("conversation_id", .integer)
            tbl.column("user_id", .integer)
            
            tbl.column("text", .text)
            tbl.column("m_type", .integer)
            tbl.column("status", .integer)
            tbl.column("timestamp", .integer)
            
            tbl.column("url", .text)
            tbl.column("url_domain", .text)
            tbl.column("url_text", .text)
            tbl.column("url_title", .text)
            tbl.column("url_thumb_url", .text)
            
        }
    }
    
    private func createGIFCategoriesTable() {
        self.create(TableName.GIFCategories.rawValue) { tbl in
            tbl.column("item", .blob)
        }
    }
    
    
    // MARK: Utilities func
    
    func isMessagesTableEmpty() -> Bool {
        return select(MessageModel.self)?.isEmpty ?? true
    }
    
    func createAllTables() {
        self.createMessagesTable()
        self.createConversationTable()
        self.createGIFCategoriesTable()
    }
    
    func deleteConversations() {
        self.deleteAll(ConversationModel.self)
    }
    
    func deleteAppData() {
        self.deleteAll(MessageModel.self)
        self.deleteAll(ConversationModel.self)
        self.deleteAll(GIFCategoryItem.self)
    }
    
}
