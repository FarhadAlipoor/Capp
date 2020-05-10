//
//  AppDelegate.swift
//  Capp
//
//  Created by tannaz on 11/19/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase
import FirebaseInstanceID
import FirebaseMessaging
import GoogleMaps
import os.log

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        FirebaseApp.configure()
        
        if let token = InstanceID.instanceID().token() {
            print("FCM TOKEN : \(token)")
            StoringData.fcmToken = token
        }
        // get the token
        UIApplication.shared.registerForRemoteNotifications()
        GMSServices.provideAPIKey("AIzaSyCxCPM0dGL1uS7JP4MKiZwhYq4IbY97sGM")
        return true
    }
    
    // MARK: - Registering Notifications
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        os_log("token: %@", type: .error, deviceToken.hexEncodedString())
        print(deviceToken.hexEncodedString())
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("failed to register: \(error)" )
    }
    
    // MARK: - User Notification
    
    // On iOS 11 beta 2, this method is not called at all
    // On iOS 10 and lower, this method is called when the application is both in foreground or background
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        let data = try! JSONSerialization.data(withJSONObject: userInfo, options: .prettyPrinted)
        let json = String(data: data, encoding: .utf8)!
        
        os_log("Received message for data push: %@", type: .error, json)
        
        
        let alertController = UIAlertController(title: "Received payload", message: "\(json)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        
        window!.rootViewController?.present(alertController, animated: true)
        
        completionHandler(.newData)
    }
}

extension Data {
    func hexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}

