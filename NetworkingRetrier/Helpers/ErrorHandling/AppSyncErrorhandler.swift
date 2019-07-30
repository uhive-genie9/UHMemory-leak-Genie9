//
//  AppSyncErrorhandler.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 4/15/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation

//MARK: - SUBSCRIPTION ERROR HANDLER
class AppSyncErrorHandler {
    
    private weak var subscriptionErrorHandlingDelegate: SubscribtionErrorHandlerDelegate?

    init(delegate: SubscribtionErrorHandlerDelegate?) {
        self.subscriptionErrorHandlingDelegate = delegate
    }


    
   final func handleAppSyncErrors(for appSyncError: AppSyncErrors) {
        
        switch appSyncError {
        case .unauthorized:
            print("unauthorized handler")
            subscriptionErrorHandlingDelegate?.doUnauthorized()
            
        case .subscriptionTerminated:
            print("subscription Terminated")
            subscriptionErrorHandlingDelegate?.doSubscriptionTerminated()
            
        case .generalError:
            print("General Error")
            subscriptionErrorHandlingDelegate?.doGeneralError()
        }
    }

}
