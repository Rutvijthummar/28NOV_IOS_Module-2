//
//  AppDelegate.swift
//  M5ASS16
//
//  Created by MAC on 24/05/23.
//

import UIKit

var appDel = UIApplication.shared.delegate as? AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        goToHome()
        goToLogin()
        
        // Override point for customization after application launch.
        return true
    }
    
    func goToHome() {
        var getStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let nav = getStoryBoard.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        window?.rootViewController = UINavigationController(rootViewController: nav ?? UIViewController())
        window?.makeKeyAndVisible()
    }
    
    func goToLogin() {
        var getStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let nav = getStoryBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        window?.rootViewController = UINavigationController(rootViewController: nav ?? UIViewController())
        window?.makeKeyAndVisible()
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

