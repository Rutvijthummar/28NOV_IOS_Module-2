//
//  LogInVC.swift
//  M4ASS1,2
//
//  Created by MAC on 26/01/23.
//  Make an app to Design login and sign up screen as we seen in any application.
// Make an app to Generate alert when user successfully login.

import Foundation
import UIKit



class LogInVC: UIViewController {

    @IBOutlet weak var lblLogIn: UILabel!
    @IBOutlet weak var vwEmail: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var vwPassword: UIView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnForgetPassword: UIButton!
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func btnLoginTapped(_ sender: Any) {
        
        
        if self.txtEmail.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Please Enter Email", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        if  !self.isValidEmail(self.txtEmail.text!){
                   let alert = UIAlertController(title: "Alert", message: "Please enter valid enter email", preferredStyle: .alert)
                          let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
               }
                   alert.addAction(actionOK)
                   self.present(alert, animated: true, completion: nil)
               }
        if self.txtPassword.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Please Enter Password", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func btnForgetPasswordTapped(_ sender: Any) {
    }
    
    func setUp() {
        
        self.lblLogIn.text = "Log In"
        
        self.txtEmail.placeholder = "Enter Email"
        
        self.txtPassword.placeholder = "Password"
        
        self.btnLogin.setTitle("Login", for: .normal)
        
        self.btnForgetPassword.setTitle("Forget Password?", for: .normal)
        
    }
    
    func applyStyle() {
        
        self.lblLogIn.font = UIFont.boldSystemFont(ofSize: 25)
        self.lblLogIn.textColor = UIColor.systemPink
        
        self.vwEmail.layer.borderWidth = 1.0
        self.vwEmail.layer.borderColor = UIColor.systemGray.cgColor
        self.vwEmail.layer.masksToBounds = true
        
        self.txtEmail.keyboardType = .emailAddress
        
        self.vwPassword.layer.borderWidth = 1.0
        self.vwPassword.layer.borderColor = UIColor.systemGray.cgColor
        self.vwPassword.layer.masksToBounds = true
        
        self.txtPassword.keyboardType = .default
        
        self.btnLogin.backgroundColor = UIColor.systemPink
        self.btnLogin.setTitleColor(.white, for: .normal)
        self.btnLogin.layer.cornerRadius = 25.0
        self.btnLogin.layer.masksToBounds = true
        
        
        
        DispatchQueue.main.async {
            self.vwEmail.layer.cornerRadius = self.vwEmail.frame.size.height / 2
            self.vwPassword.layer.cornerRadius = self.vwEmail.frame.size.height / 2
            self.btnLogin.layer.cornerRadius = self.btnLogin.frame.size.height / 2
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUp()
        
        self.applyStyle()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
}
