//
//  ConnectionStateHelper.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 4/15/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import AWSAppSync
//MARK: - HANDLING CONNECTION STATE(OFFLINE/ONLINE)

protocol ConnectionStateChangeHandlerDelegate: class {
    func connectionDidBecomeOffline()
    func connectionDidBecomeOnline()
}

class ConnectionStateHelper: ConnectionStateChangeHandler {
    weak var connectionStateChangeHandlerDelegate: ConnectionStateChangeHandlerDelegate?

    init(delegate: ConnectionStateChangeHandlerDelegate?) {
        self.connectionStateChangeHandlerDelegate = delegate
    }
    func stateChanged(networkState: ClientNetworkAccessState) { // handle networking states
        switch networkState {
        case .Offline:
            connectionStateChangeHandlerDelegate?.connectionDidBecomeOffline()
        case .Online:
            connectionStateChangeHandlerDelegate?.connectionDidBecomeOnline()
        }
    }
    
}

