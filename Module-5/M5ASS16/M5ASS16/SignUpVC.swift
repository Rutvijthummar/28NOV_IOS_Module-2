//
//  SignUpVC.swift
//  M5ASS16
//
//  Created by MAC on 24/05/23.
//

import Foundation
import UIKit


class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnSignUpTapped(_ sender: Any) {
        
        let username = txtUserName?.text
             let password = txtPassword?.text
        let fullName = txtName.text
        let email = txtEmail.text
        let mobile = txtMobile.text
             let obj = UserModel(user: username, password: password, fullname: fullName, email: email, mobile: mobile)
             
             if let obj = getUserdata().first(where: {$0.user == obj.user && $0.password == obj.password}){
                 // show alert -> user already exist
                 utilityFunction().showSimpleAlert(vc: self, title: "Oops", message: "User already exist")
             } else {
                 saveDataInPlistFile(obj: obj) {
                     // step: 1 -> save this user as login user
                     // step: 2 -> navigate to home screen
                     DispatchQueue.main.async {
                         UserDefaults.standard.setValue(true, forKey: "cuser")
                         appDel?.goToHome()
                     }
                   
                 }
             }
        
    }
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
