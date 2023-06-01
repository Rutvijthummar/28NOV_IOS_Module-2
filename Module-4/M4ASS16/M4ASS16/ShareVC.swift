//
//  ShareVC.swift
//  M4ASS16
//
//  Created by MAC on 16/02/23.
//  Make an app to share a text with UIActivity View Controls.

import Foundation
import UIKit



class ShareVC: UIViewController {
    
    
    @IBOutlet weak var vwShare: UIView!
    @IBOutlet weak var txtSharing: UITextField!
    @IBOutlet weak var btnShare: UIButton!
    
    @IBAction func btnShareTapped(_ sender: Any) {
        
        let activity = UIActivityViewController(activityItems: [txtSharing.text ?? ""], applicationActivities: nil)
               present(activity, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.vwShare.layer.borderColor = UIColor.darkGray.cgColor
        self.vwShare.layer.borderWidth = 1.0
        
        self.txtSharing.placeholder = "Enter Text"
        
        self.btnShare.setTitle("Share", for: .normal)
        self.btnShare.tintColor = .blue
        self.btnShare.backgroundColor = .green
        
        DispatchQueue.main.async {
            self.vwShare.layer.cornerRadius = self.vwShare.frame.size.height / 2
            self.btnShare.layer.cornerRadius = self.btnShare.frame.size.height / 2
        }
        
    }
}
