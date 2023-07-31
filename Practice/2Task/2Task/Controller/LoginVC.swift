//
//  LoginVC.swift
//  2Task
//
//  Created by MAC on 19/07/23.
//

import Foundation
import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        
        let alert=UIAlertController(title: "Login", message: "Enter Username and Password!", preferredStyle: .alert)
        alert.addTextField { (txtusername) in
            txtusername.placeholder="Enter Username"
            txtusername.textAlignment = .center
        }
        alert.addTextField { (txtpassword) in
            txtpassword.placeholder="Enter Password"
            txtpassword.textAlignment = .center
            txtpassword.isSecureTextEntry=true
        }
        let ok=UIAlertAction(title: "Login", style:.destructive, handler:{ACTION in
            
            self.lblName.text=alert.textFields![0].text
            self.lblPassword.text=alert.textFields![1].text
        })
        let more=UIAlertAction(title: "Cancel", style:.default, handler: nil)
        alert.addAction(more)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
        
    }
}
