//
//  AppDelegate.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 3/24/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import UIKit
import AWSAppSync

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
 
    var window: UIWindow?
    
    var amplifyHelper = AWSAmplifyHelper()
    var userService = UserService()
    var gifService = TenorGIF()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DBHelper.shared.createAllTables()

        gifService.registerAnonymous {[weak self] in
            self?.gifService.getGIFCategories()
        }

        let latestMessageInDB = DBHelper.shared.getLatestMessage()
        let messageID = latestMessageInDB?.messageId
        
        userService.refreshUserToken(refreshToken: senderRefreshToken) {
            print("user authorized")
            self.amplifyHelper.configureAmplify(completion: {[weak self] in
                self?.amplifyHelper.startUserSubscription(senderId: senderId)
                self?.amplifyHelper.getConversations(baseConv: nil, fetchCount: 5, nextToken: "", userId: senderId, completion: { _,_ in })
                self?.amplifyHelper.getUserMessages(userId: senderId, fetchCount: 10, from: Int(messageID ?? "")) //
            })
        }
        
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        let latestMessageInDB = DBHelper.shared.getLatestMessage()
        let messageID = latestMessageInDB?.messageId
        amplifyHelper.getUserMessages(userId: senderId, fetchCount: 10, from: Int(messageID ?? "")) //
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

