//
//  NotificationVC.swift
//  ASS11
//
//  Created by MAC on 02/06/23.
//  Make an app for local notification.

import Foundation
import UIKit
import UserNotifications


class NotificationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func btnNotificationTapped(_ sender: Any) {
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Remainder"
        content.body = "This is a Local Notification"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
        
        let request = UNNotificationRequest(identifier: "remainder", content: content, trigger: trigger)
        center.add(request) { (error) in
            if error != nil {
                print("Error = \(error?.localizedDescription ?? "error local notification")")
            }
        }
        
    }
    
}
