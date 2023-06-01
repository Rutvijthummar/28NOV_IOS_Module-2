//
//  AlertVC.swift
//  M4ASS5
//
//  Created by MAC on 07/02/23.
//  Make an app for present alert with two text field and two action
//  now get both value from text field through button click.

import Foundation
import UIKit



class AlertVC: UIViewController {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnShow: UIButton!
    
    
    @IBAction func btnShowTapped(_ sender: Any) {
        
        let alert=UIAlertController(title: "Data", message: "Enter Information", preferredStyle: .alert)
        alert.addTextField { (txtusername) in
            txtusername.placeholder="Enter Name"
            txtusername.textAlignment = .center
        }
        alert.addTextField { (txtpassword) in
            txtpassword.placeholder="Enter City"
            txtpassword.textAlignment = .center
            
        }
        let ok=UIAlertAction(title: "Login", style:.destructive, handler:{ACTION in
            
            self.lblTitle.text=alert.textFields![0].text
            self.lblMessage.text=alert.textFields![1].text
            self.lblTitle.textColor = .red
            self.lblMessage.textColor = .green
        })
        let more=UIAlertAction(title: "Cancel", style:.default, handler: nil)
        alert.addAction(more)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblTitle.text = "Title"
        
        self.lblMessage.text = "Message"
        
        self.btnShow.setTitle("Show", for: .normal)
        
        self.btnShow.setTitleColor(.white, for: .normal)
        
        self.btnShow.backgroundColor = .blue
        
        DispatchQueue.main.async {
            self.btnShow.layer.cornerRadius = self.btnShow.frame.size.height / 2
        }
        
    }
}
