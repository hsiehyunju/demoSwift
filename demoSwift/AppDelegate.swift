//
//  AppDelegate.swift
//  demoSwift
//
//  Created by hsiehyunju on 2023/6/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController.init()
        appCoordinator = AppCoordinator(navcontroller: navigationController)
        appCoordinator!.start()
        
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        return true
    }
}
