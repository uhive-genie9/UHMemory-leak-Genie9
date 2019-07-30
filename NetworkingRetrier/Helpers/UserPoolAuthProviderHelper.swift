//
//  UserPoolAuthProviderHelper.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 4/15/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import AWSAppSync

//MARK: - TOKEN

class UserPoolAuthProviderHelper: AWSCognitoUserPoolsAuthProvider {
    
    func getLatestAuthToken() -> String {
       return UserDefault.Shared.getIdToken()
    }
    
}

