//
//  AppDelegate.swift
//  Assessment-1
//
//  Created by MAC on 13/06/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var strPath = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        datacopypaste()
        return true
    }
    
    func datacopypaste()
    {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
       // print(path)
        strPath=path+"/rutvij_db.db"
        print(strPath)
        
        if !FileManager.default.fileExists(atPath: strPath)
        {
            do
            {
                let selectdb = Bundle.main.path(forResource: "rutvij_db", ofType: "db")
                try FileManager.default.copyItem(atPath: selectdb!, toPath: strPath)
                print("database file copy!")
            }
            catch
            {
                print(error.localizedDescription)
            }
        }
        else {
            print("file are already exists!")
        }
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

