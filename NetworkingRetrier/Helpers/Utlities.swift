//
//  Utlities.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 5/23/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation

// Locking func
func locked(_ lock: Any, closure: () -> Void) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
    
}

// MARK: - Paths and URLS
/// getting document's url
func getDocumentsUrl() -> URL? {
    let fileManager = FileManager.default
    let documentsUrl = fileManager.urls(for: .documentDirectory,
                                        in: .userDomainMask)
    return documentsUrl.first
}
