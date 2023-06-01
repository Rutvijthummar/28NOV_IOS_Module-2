//
//  DataVC.swift
//  M4ASS3
//
//  Created by MAC on 03/02/23.
// Make an app when we click on button that time value will be
// displayed from text field to the label.

import Foundation
import UIKit


class DataVC: UIViewController {

    @IBOutlet weak var vwName: UIView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var vwCity: UIView!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var btnDone: UIButton!
    
    @IBAction func btnDoneTapped(_ sender: Any) {
        
        lblName.text = txtName.text
        self.lblName.textColor = .red
        self.lblName.font = UIFont.systemFont(ofSize: 25)
        
        lblCity.text = txtCity.text
        self.lblCity.textColor = .blue
        self.lblCity.font = UIFont.systemFont(ofSize: 25)
        
    }
    
    func SetUp() {
    
        self.txtName.placeholder = "Enter Name"
        
        self.txtCity.placeholder = "Enter City"
        
        self.lblName.text = "Name"
        
        self.lblCity.text = "City"
        
        self.btnDone.setTitle("Show", for: .normal)
        
        
    
    }
    
    func applyStyle() {
        
        self.vwName.layer.borderColor = UIColor.darkGray.cgColor
        self.vwName.layer.borderWidth = 1.0
        
        self.vwCity.layer.borderColor = UIColor.darkGray.cgColor
        self.vwCity.layer.borderWidth = 1.0
        
        self.lblName.textColor = .black
        
        self.lblCity.textColor = .black
        
        self.btnDone.setTitleColor(.black, for: .normal)
        self.btnDone.backgroundColor = .green
        
        DispatchQueue.main.async {
            
            self.vwName.layer.cornerRadius = self.vwName.frame.size.height / 2
            self.vwCity.layer.cornerRadius = self.vwName.frame.size.height / 2
            self.btnDone.layer.cornerRadius = self.btnDone.frame.size.height / 2
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SetUp()
        
        self.applyStyle()
        
    }
}
