//
//  HomeVC.swift
//  CrudOperation
//
//  Created by MAC on 06/03/23.
//

import Foundation
import UIKit

// MARK: - Class Of UiViewController -

class HomeVC: UIViewController {
    
// MARK: - Outlet -
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var vwFullName: UIView!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var vwCity: UIView!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var vwEmail: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var vwMobile: UIView!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnShowData: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    
// MARK: - Button Action Method -
    
    @IBAction func btnSaveTapped(_ sender: Any) {
        
        self.saveInfo()
        
    }
    
    @IBAction func btnShowDataTapped(_ sender: Any) {
        
        let showVC=storyboard?.instantiateViewController(identifier: "ShowDataVC") as! ShowDataVC
        showVC.modalPresentationStyle = .fullScreen
        present(showVC, animated: true, completion: nil)
        
    }
    
    @IBAction func btnLogoutTapped(_ sender: Any) {
        
        UserDefaults.standard.setValue(false, forKey: "cuser")
        dismiss(animated: true, completion: nil)
        
    }
    
// MARK: - Custom Function Of SaveInfo -
    
    func saveInfo() {
        
        let save_userinfo="insert into userinfo(fullname,city,email,mobile) values('\(txtFullName.text!)','\(txtCity.text!)','\(txtEmail.text!)',\(txtMobile.text!))"
        print(save_userinfo)
        
        
        let dml=DMLOperations()
        let result=dml.dmlservices(query: save_userinfo)
        
        if result==true
        {
            let alert=UIAlertController(title: "Sucess", message: "Your data has been saved!😎", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            
            txtFullName.text=""
            txtCity.text=""
            txtEmail.text=""
            txtMobile.text=""
        }
        
        else
        {
            let alert=UIAlertController(title: "Error", message: "Something went wrong...Try again!😟", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            let more=UIAlertAction(title: "MORE", style: .destructive, handler: nil)
            alert.addAction(ok)
            alert.addAction(more)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
// MARK: - Custom Function Of Setup -
    
    func setUp() {
        
        self.imgProfile.image = UIImage(named: "Profile")
        
        self.txtFullName.placeholder = "Enter Name"
        
        self.txtCity.placeholder = "Enter City"
        
        self.txtEmail.placeholder = "Enter Email"
        
        self.txtMobile.placeholder = "Enter Mobile Number"
        
        self.btnSave.setTitle("Save", for: .normal)
        
        self.btnShowData.setTitle("ShowData", for: .normal)
        
        self.btnLogout.setTitle("Logout", for: .normal)
        
    }
    
// MARK: - Custom Function Of ApplyStyle -
    
    func applyStyle() {
        
        self.vwFullName.layer.borderColor = UIColor.darkGray.cgColor
        self.vwFullName.layer.borderWidth = 1.0
        
        self.vwCity.layer.borderColor = UIColor.darkGray.cgColor
        self.vwCity.layer.borderWidth = 1.0
        
        self.vwEmail.layer.borderColor = UIColor.darkGray.cgColor
        self.vwEmail.layer.borderWidth = 1.0
        
        self.vwMobile.layer.borderColor = UIColor.darkGray.cgColor
        self.vwMobile.layer.borderWidth = 1.0
        
        self.btnSave.backgroundColor = .green
        self.btnSave.tintColor = .black
        
        self.btnShowData.backgroundColor = .yellow
        self.btnShowData.tintColor = .blue
        
        self.btnLogout.backgroundColor = .red
        self.btnLogout.tintColor = .black
        
        self.btnSave.layer.borderColor = UIColor.darkGray.cgColor
        self.btnSave.layer.borderWidth = 1.0
        
        self.btnShowData.layer.borderColor = UIColor.darkGray.cgColor
        self.btnShowData.layer.borderWidth = 1.0
        
        DispatchQueue.main.async {
            
            self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.height / 2
            
            self.vwFullName.layer.cornerRadius = self.vwFullName.frame.size.height / 2
            
            self.vwCity.layer.cornerRadius = self.vwCity.frame.size.height / 2
            
            self.vwEmail.layer.cornerRadius = self.vwEmail.frame.size.height / 2
            
            self.vwMobile.layer.cornerRadius = self.vwMobile.frame.size.height / 2
            
            self.btnSave.layer.cornerRadius = self.btnSave.frame.size.height / 2
            
            self.btnShowData.layer.cornerRadius = self.btnShowData.frame.size.height / 2
            
            self.btnLogout.layer.cornerRadius = self.btnLogout.frame.size.height / 2
            
        }
        
    }
    
// MARK: - View Did Load Method -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUp()
        
        self.applyStyle()
        
    }
}
