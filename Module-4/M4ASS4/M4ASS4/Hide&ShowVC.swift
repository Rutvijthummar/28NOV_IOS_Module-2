//
//  Hide&ShowVC.swift
//  M4ASS4
//
//  Created by MAC on 03/02/23.
//  Make an app to take two button for hide and show label.

import Foundation
import UIKit


class HideShowVC: UIViewController {
    
    
    @IBOutlet weak var btnHide: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblSubject: UILabel!
    @IBOutlet weak var btnShow: UIButton!
    
    @IBAction func btnHideTapped(_ sender: Any) {
        
        self.lblName.isHidden = true
        
        self.lblEmail.isHidden = true
        
        self.lblCity.isHidden = true
        
        self.lblSubject.isHidden = true
        
    }
    
    @IBAction func btnShowTapped(_ sender: Any) {
        
        self.lblName.isHidden = false
        self.lblName.font = UIFont.systemFont(ofSize: 30)
        self.lblName.textColor = .placeholderText
        
        self.lblEmail.isHidden = false
        self.lblEmail.font = UIFont.systemFont(ofSize: 30)
        self.lblEmail.textColor = .placeholderText
        
        self.lblCity.isHidden = false
        self.lblCity.font = UIFont.systemFont(ofSize: 30)
        self.lblCity.textColor = .placeholderText
        
        self.lblSubject.isHidden = false
        self.lblSubject.font = UIFont.systemFont(ofSize: 30)
        self.lblSubject.textColor = .placeholderText
        
    }
    
    func SetUp() {
        
        self.lblName.text = "Rutvij"
        
        self.lblEmail.text = "r@gmail.com"
        
        self.lblCity.text = "Junagadh"
        
        self.lblSubject.text = "IOS"
        
        self.btnHide.setTitle("Hide", for: .normal)
        
        self.btnShow.setTitle("Show", for: .normal)
        
    }
    
    func applyStyle() {
        
        self.lblName.textColor = .blue
        self.lblName.font = UIFont.systemFont(ofSize: 20)
        
        self.lblEmail.textColor = .red
        self.lblEmail.font = UIFont.systemFont(ofSize: 20)
        
        self.lblCity.textColor = .brown
        self.lblCity.font = UIFont.systemFont(ofSize: 20)
        
        self.lblSubject.textColor = .green
        self.lblSubject.font = UIFont.systemFont(ofSize: 20)
        
        self.btnHide.setTitleColor(.white, for: .normal)
        self.btnHide.backgroundColor = .darkGray
        
        self.btnShow.setTitleColor(.black, for: .normal)
        self.btnShow.backgroundColor = .magenta
        
        DispatchQueue.main.async {
            
            self.btnHide.layer.cornerRadius = self.btnHide.frame.size.height / 2
            self.btnShow.layer.cornerRadius = self.btnShow.frame.size.height / 2
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SetUp()
        
        self.applyStyle()
        
    }
}
