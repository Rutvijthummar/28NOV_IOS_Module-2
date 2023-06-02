//
//  HomeVC.swift
//  CoreDataPractice
//
//  Created by MAC on 30/03/23.
//

import Foundation
import UIKit


class HomeVC: UIViewController {
    
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var btnLogout: UIButton!

    @IBAction func btnLogoutTapped(_ sender: Any) {
        
        UserDefaults.standard.setValue(false, forKey: "cuser")
        dismiss(animated: true, completion: nil)
        
    }
    
    func Setup() {
        
        self.lblWelcome.text = "Welcome"
        
        self.btnLogout.setTitle("Logout", for: .normal)
        
    }
    
    func ApplyStyle() {
        
        self.lblWelcome.textColor = .systemBlue
        self.lblWelcome.font = UIFont.systemFont(ofSize: 30)
        
        self.btnLogout.tintColor = .black
        self.btnLogout.backgroundColor = .green
        
        DispatchQueue.main.async {
            
            self.btnLogout.layer.cornerRadius = self.btnLogout.frame.size.height / 2
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Setup()
        
        self.ApplyStyle()
        
    }
    
}
