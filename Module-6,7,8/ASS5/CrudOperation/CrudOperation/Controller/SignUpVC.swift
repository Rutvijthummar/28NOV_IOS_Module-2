//
//  SignUpVC.swift
//  CrudOperation
//
//  Created by MAC on 06/03/23.
//

import Foundation
import UIKit

// MARK: - Class Of UiViewController -

class SignUpVC: UIViewController {
    
// MARK: - Outlet -
    
    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var vwFirstName: UIView!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var vwLastName: UIView!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var vwUserName: UIView!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var vwPassword: UIView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
// MARK: - Button Action Method -
    
    @IBAction func btnSignUpTapped(_ sender: Any) {
        
        self.signUp()
        
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
// MARK: - Custom Function Of Sign Up -
    
    func signUp() {
        
        let createUser = "insert into signup(firstname,lastname,username,password)values('\(txtFirstName.text!)','\(txtLastName.text!)','\(txtUserName.text!)','\(txtPassword.text!)')"
        print(createUser)
        
        let dml=DMLOperations()
        let result=dml.dmlservices(query: createUser)
        
        if result==true
        {
            let alert=UIAlertController(title: "Success", message: "Signup successfull!🎭", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler:{ACTION in
                
                self.txtFirstName.text=""
                self.txtLastName.text=""
                self.txtUserName.text=""
                self.txtPassword.text=""
                self.navigationController?.popToRootViewController(animated: true)
            })
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            
        }
        else
        {
            let alert=UIAlertController(title: "Error", message:"Somthing went wrong...Try again!😕", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            let more=UIAlertAction(title: "MORE", style: .destructive, handler: nil)
            alert.addAction(ok)
            alert.addAction(more)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
// MARK: - Custom Function Of Setup -
    
    func SetUp() {
        
        self.lblSignUp.text = "SignUp"
        
        self.imgUser.image = UIImage(named: "Profile")
        
        self.txtFirstName.placeholder = "Enter First Name"
        
        self.txtLastName.placeholder = "Enter Last Name"
        
        self.txtUserName.placeholder = "Enter User Name"
        
        self.txtPassword.placeholder = "Enter Password"
        
        self.btnSignUp.setTitle("SignUp", for: .normal)
        
    }
    
// MARK: - Custom Function Of Applystyle -
    
    func ApplyStyle() {
        
        self.vwFirstName.layer.borderColor = UIColor.darkGray.cgColor
        self.vwFirstName.layer.borderWidth = 1.0
        
        self.vwLastName.layer.borderColor = UIColor.darkGray.cgColor
        self.vwLastName.layer.borderWidth = 1.0
        
        self.vwUserName.layer.borderColor = UIColor.darkGray.cgColor
        self.vwUserName.layer.borderWidth = 1.0
        
        self.vwPassword.layer.borderColor = UIColor.darkGray.cgColor
        self.vwPassword.layer.borderWidth = 1.0
        
        self.txtPassword.isSecureTextEntry = true
        
        self.btnSignUp.backgroundColor = .white
        self.btnSignUp.tintColor = .black
        
        DispatchQueue.main.async {
            
            self.imgUser.layer.cornerRadius = self.imgUser.frame.size.height / 2
            
            self.vwFirstName.layer.cornerRadius = self.vwFirstName.frame.size.height / 2
            
            self.vwLastName.layer.cornerRadius = self.vwLastName.frame.size.height / 2
            
            self.vwUserName.layer.cornerRadius = self.vwUserName.frame.size.height / 2
            
            self.vwPassword.layer.cornerRadius = self.vwPassword.frame.size.height / 2
            
            self.btnSignUp.layer.cornerRadius = self.btnSignUp.frame.size.height / 2
            
        }
        
    }
    
// MARK: - View Did Load Method -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.SetUp()
        
        self.ApplyStyle()
        
    }
    
// MARK: - View Will Appear Method -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
// MARK: - View Will Disappear -

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
