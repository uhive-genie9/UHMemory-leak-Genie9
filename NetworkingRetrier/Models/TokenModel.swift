//
//  TokenModel.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 4/17/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
protocol Configurable: Codable {}

class TokenModel: Codable {
    var accessToken: String
    var idToken: String
    enum CodingKeys: String, CodingKey {
        case accessToken = "AccessToken"
        case idToken = "IdToken"
    }
}
