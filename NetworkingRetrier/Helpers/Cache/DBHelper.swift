//
//  DBHelper.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 5/22/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import GRDB

protocol Cacheable: PersistableRecord, FetchableRecord {}

enum DatabaseOrder {
    case asc, dsc
}

enum TableName: String {
    case message = "Messages", conversation = "Conversations", GIFCategories = "GIFCategories"
}

class DBHelper {
    
    private let DBName = "Chat101.db"
    static let shared = DBHelper()
    private var databaseQueue: DatabaseQueue?

    private init() {}
    
    /// creates and opens a connection to the database
    ///
    /// - Returns: DatabaseQueue
    private func connection() -> DatabaseQueue? {
        do {
            
            var config = Configuration()
//            config.trace = { print("SQL statements \($0)") }     // Prints all SQL statements
            config.label = "Chat101NativeDatabase"
            config.busyMode = .callback({ (errorCode) -> Bool in
                
                print("SQLITE Error code \(errorCode)")
                
                return errorCode < 3
            })
            if databaseQueue == nil {
                databaseQueue = try DatabaseQueue(path: getDatabasePathIfNeeded() ?? "", configuration: config)
            }
            return databaseQueue
            
        } catch {
            print(error)
            return nil
        }
    }
    
    
    /// inserts a cacheacble object
    ///
    /// - Parameter cacheable: cacheacble object
    func insert(_ cacheable: Cacheable) {
        do {
            //            try connection()?.write { dbs  in
            //                try cacheable.insert(dbs)
           try connection()?.write { dbs in
                try cacheable.insert(dbs)
            }
        } catch {
            print(error)
        }
        
    }
    
    /// insert and update(if already exists) a cacheacble object
    ///
    /// - Parameter cacheable: cacheacble object
    func save(_ cacheable: Cacheable) {
        locked(self) {
            do {
                try connection()?.write { dbs  in
                    
                    try cacheable.save(dbs)
                   
                }
            } catch {
            print(error)
            }
        }
    }

    
    /// inserts a cacheacble array of objects
    ///
    /// - Parameter cacheables: cacheacble array of cacheables objects
    func bulkInsert(_ cacheables: [Cacheable]) {
        do {
            try connection()?.write { dbs  in
                for cacheable in cacheables {
                    try cacheable.insert(dbs)
                }
            }
        } catch {
           
        }
    }
    
    /// insert and update(if already exists) an array of objects
    ///
    /// - Parameter cacheables: array of cacheables objects
    func bulkSave(_ cacheables: [Cacheable]) {
        
        locked(self) {
            
            do {
                try connection()?.write { dbs  in
                    for cacheable in cacheables {
                        try cacheable.save(dbs)
                    }
                }
            } catch {
              print(error)
            }
        }
        
    }
    
    func updateBy<T: Cacheable>(key: Int, _ ofType: T.Type, newCacheable: T) {
        
        do {
            try connection()?.write { dbs  in
                if var cacheable = try T.fetchOne(dbs, key: key) {
                    cacheable = newCacheable
                    try cacheable.update(dbs)
                } else {
                    print("failed finding")
                }
            }
        } catch {
            print(error)
        }
        
    }
    
    /// retrieves cacheable objects
    ///
    /// - Parameter ofType: object type
    /// - Returns: cacheable objects
    func select<T: Cacheable>(_ ofType: T.Type) -> [T]? {
        
        do {
            return try connection()?.read { dbs -> [T] in
                
                return try T.fetchAll(dbs)
            }
        } catch {
           
            return nil
        }
    }
    
    /// retrieves a cacheable object
    ///
    /// - Parameter ofType: object type
    /// - Returns: single cacheable object
    func selectSingle<T: Cacheable>(_ ofType: T.Type) -> T? {
        return select(ofType)?.first ?? nil
    }
    
    /// check cacheable table is empty
    ///
    /// - Parameter ofType: object type
    /// - Returns: retrieve boolean is empty or not
    func isEmpty<T: Cacheable>(_ ofType: T.Type) -> Bool {
        return self.select(ofType)?.isEmpty ?? false
    }
    
    /// delete all cacheable from table
    ///
    /// - Parameter ofType: object type
    func deleteAll<T: Cacheable>(_ ofType: T.Type) {
        do {
            _ = try connection()?.write { dbs  in
                try T.deleteAll(dbs)
            }
        } catch {
        
        }
    }
    /// delete cacheable objects using a where statement
    ///
    /// - Parameters:
    ///   - ofType: object type
    ///   - command: SQL statement
    ///   - args: arguments which are related to the SQL statement
    func deleteBy<T: Cacheable>(_ ofType: T.Type, command: String, args: StatementArguments) {
        do {
            _ = try connection()?.write { dbs in
                
                try T.filter(sql: command, arguments: args).deleteAll(dbs)
                
            }
        } catch {
            
        }
    }
    
    /// retrieves cacheable objects using a where statement
    ///
    /// - Parameters:
    ///   - ofType: object type
    ///   - command: SQL statement
    ///   - args: arguments which are related to the SQL statement
    /// - Returns: cacheble objects
    func selectBy<T: Cacheable>(_ ofType: T.Type, command: String, args: StatementArguments) -> [T]? {
        do {
            return try connection()?.read { dbs -> [T] in
                
                return try T.filter(sql: command, arguments: args).fetchAll(dbs)
                
            }
        } catch {
           
            return nil
        }
    }
    
    func selectByOrder<T: Cacheable>(_ ofType: T.Type, orderCommand: String, order: DatabaseOrder = .dsc, filterCommand: String, args: StatementArguments) -> [T]? {
        
        do {
            return try connection()?.read { dbs -> [T] in
                let orderedList =  try T.filter(sql: filterCommand, arguments: args).order(sql: orderCommand).fetchAll(dbs)
                return order == .dsc ? orderedList.reversed() : orderedList
            }
        } catch {
          print(error)
            return nil
            
        }
        
    }
    
    /// retrieves a cacheable object using a where statement
    ///
    /// - Parameters:
    ///   - ofType: object type
    ///   - command: SQL statement
    ///   - args: arguments which are related to the SQL statement
    /// - Returns: single cacheble object
    func singleSelectBy<T: Cacheable>(_ ofType: T.Type, command: String, args: StatementArguments) -> T? {
        do {
            return try connection()?.read { dbs -> T? in
                
                return try T.filter(sql: command, arguments: args).fetchOne(dbs)
                
            }
        } catch {
            print(error)
            return nil
        }
    }
    
    func singleSelectLast<T: Cacheable>(_ ofType: T.Type) -> T? {
        do {
            return try connection()?.read { dbs -> T? in
                
                return try T.all().fetchAll(dbs).last
            }
        } catch {
            print(error)
            return nil
        }
    }
    
    func singleSelectBy<T: Cacheable>(_ ofType: T.Type, filterSQL: String) -> T? {
        do {
            return try connection()?.read { dbs -> T? in

                return try T.select(sql: filterSQL).fetchAll(dbs).last
            }
        } catch {
            print(error)
            return nil
        }
    }
    
    
    func selectFetchOne(filterCommand: String) -> Int? {
        
        do {
            return try connection()?.read { dbs -> Int? in
                let val = try Int.fetchOne(dbs, sql: filterCommand)
                //"SELECT MAX(last_action_id) FROM Conversations"
                return val ?? nil
            }
        } catch {
            print(error)
            return nil
            
        }
        
    }
    
    
    ///  retrieves a cacheable count
    ///
    /// - Parameter ofType: object type
    /// - Returns: count of cacheable objects
    func fetchCount<T: Cacheable>(_ ofType: T.Type) -> Int {
        
        do {
            return try connection()?.read { dbs -> Int in
                
                return try T.fetchCount(dbs)
                } ?? 0
        } catch {
          
            return 0
        }
    }
    
    /// creates a table
    ///
    /// - Parameters:
    ///   - tableName: table name
    ///   - tableDefinition: lets you define table columns and constraints.
    
    func create(_ tableName: String, tableDefinition: (TableDefinition) -> Void) {
        do {
            try connection()?.write { dbs in
                if  !(try dbs.tableExists(tableName)) {
                    try dbs.create(table: tableName, body: tableDefinition)
                }
            }
        } catch {
           
            
        }
    }
    
    /// gets database path in documents if existed, or create a new one if not.
    ///
    /// - Returns: database path
    private func getDatabasePathIfNeeded() -> String? {
        
        let fileManager = FileManager.default
        let finalDatabaseURL = getDocumentsUrl()!.appendingPathComponent(DBName)
        if !(fileManager.fileExists(atPath: finalDatabaseURL.path)) {
            fileManager.createFile(atPath: finalDatabaseURL.path, contents: nil, attributes: nil)
        }
        return finalDatabaseURL.path
    }
    
    /// get database path in documents
    ///
    /// - Returns: database path
    func getDatabasePath() -> String {
        return getDocumentsUrl()!.appendingPathComponent(DBName).path
    }
}

