//
//  LoginVC.swift
//  M5ASS13
//
//  Created by MAC on 22/05/23.
//

import Foundation
import UIKit

class LoginVC: UIViewController {
    
    
    @IBAction func btnBack(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        tabBarController?.selectedIndex = 0
        
    }
    
    @IBAction func btnSubmit(_ sender: Any) {
        
        // Create new Alert
        let dialogMessage = UIAlertController(title: "Login Successfully..🤩", message: "Go to Home Page", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            self.tabBarController?.selectedIndex = 2
//            let nav = self.storyboard?.instantiateViewController(withIdentifier: "thirdVC") as? ThirdViewController
//
//            self.navigationController?.pushViewController(nav ?? UIViewController(), animated: true)
        })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().backgroundColor = UIColor.white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
}
