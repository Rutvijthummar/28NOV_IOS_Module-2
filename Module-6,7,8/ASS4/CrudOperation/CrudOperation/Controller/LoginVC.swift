//
//  LoginVC.swift
//  CrudOperation
//
//  Created by MAC on 06/03/23.
//  make an app for CRUD operation for sqlite

import Foundation
import UIKit

// MARK: - Class Of UiViewController -

class LoginVC: UIViewController {
    
// MARK: - Outlet -
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var vwUserName: UIView!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var vwPassword: UIView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
// MARK: - Button Action Method -
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        
        self.login()
        
    }
    
    @IBAction func btnSignUpTapped(_ sender: Any) {
        
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
    }
    
// MARK: - Custom Function Of Login -
    
    func login() {
        
        let login_user = "select * from signup where username='\(txtUserName.text!)' and password='\(txtPassword.text!)'"
        print(login_user)
        
        let dml = DMLOperations()
        let cn = dml.loginUser(query: login_user)
        
        if cn.count>0
        {
            let alert=UIAlertController(title: "Success", message: "Login Successfull!😎", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                
                self.txtUserName.text=""
                self.txtPassword.text=""
                
                UserDefaults.standard.setValue(true, forKey: "cuser")
                
                let homeVC=self.storyboard?.instantiateViewController(identifier: "HomeVC") as! HomeVC
                homeVC.modalPresentationStyle = .fullScreen
                self.present(homeVC, animated: true, completion: nil)
            })
            
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            
        }
        
        else
        {
            let alert=UIAlertController(title: "Error", message: "Login fail...Try again!🥺", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            let more=UIAlertAction(title: "MORE", style: .destructive, handler: nil)
            alert.addAction(ok)
            alert.addAction(more)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
// MARK: - Custom Function Of Setup -
    
    func SetUp() {
        
        self.imgUser.image = UIImage(named: "Profile")
        
        self.txtUserName.placeholder = "Enter User Name"
        
        self.txtPassword.placeholder = "Enter Password"
        
        self.btnLogin.setTitle("Login", for: .normal)
        
        self.btnSignUp.setTitle("SignUp", for: .normal)
        
    }
    
// MARK: - Custom Function Of Applystyle-
    
    func applyStyle() {
        
        self.vwUserName.layer.borderColor = UIColor.darkGray.cgColor
        self.vwUserName.layer.borderWidth = 1.0
        
        self.vwPassword.layer.borderColor = UIColor.darkGray.cgColor
        self.vwPassword.layer.borderWidth = 1.0
        
        self.txtPassword.isSecureTextEntry = true
        
        self.btnLogin.backgroundColor = .white
        self.btnLogin.tintColor = .black
        
        self.btnSignUp.backgroundColor = .white
        self.btnSignUp.tintColor = .black
        
        DispatchQueue.main.async {
            
            self.imgUser.layer.cornerRadius = self.imgUser.frame.size.height / 2
            
            self.vwUserName.layer.cornerRadius = self.vwUserName.frame.size.height / 2
            
            self.vwPassword.layer.cornerRadius = self.vwPassword.frame.size.height / 2
            
            self.btnLogin.layer.cornerRadius = self.btnLogin.frame.size.height / 2
            
            self.btnSignUp.layer.cornerRadius = self.btnSignUp.frame.size.height / 2
            
        }
        
    }
    
// MARK: - View Did Load Method -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SetUp()
        
        self.applyStyle()
        
        if UserDefaults.standard.bool(forKey: "cuser")==true
        {
            let homeVC=self.storyboard?.instantiateViewController(identifier: "HomeVC") as! HomeVC
            homeVC.modalPresentationStyle = .fullScreen
            self.present(homeVC, animated: true, completion: nil)
        }
        
    }
}
