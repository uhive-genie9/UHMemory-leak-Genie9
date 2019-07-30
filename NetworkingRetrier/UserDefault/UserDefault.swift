//
//  UserDefault.swift
//  Khadimah
//
//  Created by ibraheem abuhadba on 2/24/18.
//  Copyright © 2018 base. All rights reserved.
//

import Foundation

class UserDefault {
    
    // MARK: - Singleton
    static let Shared = UserDefault()
    
    // MARK: - UserDefaults
    let defaults = UserDefaults.standard
    
    // MARK: - Properties
    let accessToken = "AccessToken"
    let idToken = "idToken"
    let nextToken = "nextToken"

    // MARK: - Refresh access-token
    func setAccessToken(_ accessToken: String){
        defaults.set(accessToken, forKey: self.accessToken)
    }
    
    func getAccessToken()->String {
        if (UserDefaults.standard.object(forKey: self.accessToken) != nil) {
            return defaults.string(forKey: self.accessToken)!
        }else{
            return ""
        }
    }
    
    // MARK: - id Token
    func setIdToken(_ idToken: String){
        defaults.set(idToken, forKey: self.idToken)
    }
    
    func getIdToken()->String {
        if (UserDefaults.standard.object(forKey: self.idToken) != nil) {
            return defaults.string(forKey: self.idToken)!
        }else{
            return ""
        }
    }
    
    // MARK: - Refresh nextT oken
    func setNextToken(_ nextToken: String?){
        defaults.set(nextToken, forKey: self.nextToken)
    }
    
    func getNextToken()->String? {
        if (UserDefaults.standard.object(forKey: self.nextToken) != nil) {
            return defaults.string(forKey: self.nextToken)!
        }else{
            return nil
        }
    }
}
