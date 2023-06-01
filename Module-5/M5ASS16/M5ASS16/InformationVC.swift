//
//  InformationVC.swift
//  M5ASS16
//
//  Created by MAC on 24/05/23.
//

import Foundation
import UIKit


class InformationVC: UIViewController {
    
    
    @IBAction func btnLogoutTapped(_ sender: Any) {
        
        UserDefaults.standard.setValue(false, forKey: "cuser")
        appDel?.goToLogin()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
