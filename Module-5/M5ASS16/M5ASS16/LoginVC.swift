//
//  LoginVC.swift
//  M5ASS16
//
//  Created by MAC on 24/05/23.
//  Make an app When user login then store all information in plist and
//  set logic like that user login only onces not every time using plist.

import Foundation
import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        
        let username = txtUserName?.text
        let password = txtPassword?.text
        let obj = UserModel(user: username, password: password)
        
        if let obj = getUserdata().first(where: {$0.user == obj.user && $0.password == obj.password}) {
            // step: 1 -> save this user as login user
            // step: 2 -> navigate to home screen
            DispatchQueue.main.async {
                //gen. the login session
                UserDefaults.standard.setValue(true, forKey: "cuser")
                
               
                appDel?.goToHome()
              
            }
        } else {
            // show alert -> user not exist
            utilityFunction().showSimpleAlert(vc: self, title: "Oops", message: "User not Exist")
        }
        
    }
    
    
    @IBAction func btnSignUpTapped(_ sender: Any) {
        
        let nav = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        navigationController?.pushViewController(nav ?? UIViewController(), animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if UserDefaults.standard.bool(forKey: "cuser")==true
        {
            let homeVC=self.storyboard?.instantiateViewController(identifier: "HomeVC") as! HomeVC
          //  homeVC.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(homeVC, animated: true)
           
        }
        
    }
    
}


extension UIViewController {
    func getUserdata() -> [UserModel] {
           let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("UserList.plist")
           if let list = try? NSArray(contentsOf: path, error: ()) {
               if let json = try? JSONSerialization.data(withJSONObject: list), let list = try? JSONDecoder().decode([UserModel].self, from: json){
                   return list
               }
           }
           return []
       }
       
       func saveDataInPlistFile(obj: UserModel, successCompletion: (()->Void)? = nil){
           var list = getUserdata()
           obj.id = list.count + 1
           list.append(obj)
           
           let encoder = PropertyListEncoder()
           encoder.outputFormat = .xml
           
           let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("UserList.plist")
           print("Plist Path", path.absoluteString)
           
           do {
               let data = try encoder.encode(list)
               try data.write(to: path)
               successCompletion?()
           } catch {
               // show error alert
               utilityFunction().showSimpleAlert(vc: self, title: "Oops", message: "Error")
               print(error)
           }
       }
}

class UserModel: Codable{
    var id: Int?
    var user: String?
    var password: String?
    var fullname : String?
    var email : String?
    var mobile : String?

    
    init(id: Int? = nil, user: String? = nil, password: String? = nil, fullname: String? = nil,
         email: String? = nil, mobile: String? = nil) {
        self.id = id
        self.user = user
        self.password = password
        self.fullname = fullname
        self.email = email
        self.mobile = mobile
    }
}


