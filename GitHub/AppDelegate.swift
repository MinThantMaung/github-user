//
//  AppDelegate.swift
//  GitHub
//
//  Created by Min Thant on 10/09/2025.
//
import UIKit
import netfox

class AppDelegate: NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
        NFX.sharedInstance().start()
        print("staging")
        #else
        print("production")
        #endif
        return true
    }
}
