//
//  HomeVC.swift
//  M4ASS1,2
//
//  Created by MAC on 26/01/23.
//

import Foundation
import UIKit

// MARK: - Class of Uiviewcontroller -

class HomeVC: UIViewController {
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
// MARK: - Button action method -
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        
        let secondVC=storyboard?.instantiateViewController(identifier: "LogInVC") as! LogInVC
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    @IBAction func btnSignUpTapped(_ sender: Any) {
        
        let thirdVC=storyboard?.instantiateViewController(identifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(thirdVC, animated: true)
        
    }
    
// MARK: - Custom setup function -
    
    func setUp() {
        
        self.lblWelcome.text = "Welcome to your App"
        
        self.lblDescription.text = "Start your ios app with this Firebase Swift Starter kit."
        
        self.btnLogin.setTitle("Login", for: .normal)
        
        self.btnSignUp.setTitle("Sign Up", for: .normal)
    }
    
// MARK: - Custom apply style function -
    
    func applyStyle() {
        
        self.lblWelcome.textColor = UIColor.systemPink
        self.lblWelcome.textAlignment = .center
        self.lblWelcome.font = UIFont.boldSystemFont(ofSize: 30)
        
        self.lblDescription.numberOfLines = 0
        self.lblDescription.textAlignment = .center
        self.lblDescription.font = UIFont.systemFont(ofSize: 20)
        
        self.btnLogin.backgroundColor = UIColor.systemPink
        self.btnLogin.setTitleColor(.white, for: .normal)
        self.btnLogin.layer.masksToBounds = true
        
        self.btnSignUp.layer.borderWidth = 1.0
        self.btnSignUp.setTitleColor(.black, for: .normal)
        self.btnSignUp.layer.masksToBounds = true
        
        DispatchQueue.main.async {
            self.btnLogin.layer.cornerRadius = self.btnLogin.frame.size.height  /  2
            self.btnSignUp.layer.cornerRadius = self.btnSignUp.frame.size.height  /  2
        }
        
    }
    
// MARK: - View did load -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUp()
        
        self.applyStyle()
        
    }
}
