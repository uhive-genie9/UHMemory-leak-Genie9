//
//  AWSCustomErrors.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 4/15/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation

enum AppSyncErrors: Int {
    
    case unauthorized = 3
    case subscriptionTerminated = 4
    case generalError = 0
    
    init?(_ value: AppSyncErrors) {
        switch value {
        case .unauthorized:
            self = .unauthorized
        case .subscriptionTerminated:
            self = .subscriptionTerminated
        case .generalError:
            self = .generalError
        }
    }
    
}
