//
//  UserService.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 6/16/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import Alamofire

class UserService {
    
    func refreshUserToken(refreshToken: String, completion: @escaping() -> Void) {
        guard let url = URL(string: "http://testing.uhive.life/api/v1/chat_auth/refresh_user_token") else {return}
        let params = ["refresh_token": refreshToken]
        let headers = [
            "BUILDNO" : "1_0.5.4",
            "Authorization" : senderAccessToken

        ]
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            guard let data = response.data else {return}
            do {
                let tokenModel = try JSONDecoder().decode(TokenModel.self, from: data)
                UserDefault.Shared.setAccessToken(tokenModel.accessToken)
                UserDefault.Shared.setIdToken(tokenModel.idToken)
                completion()
            }catch let error {
                print(error)
            }
        }
    }
    
}
