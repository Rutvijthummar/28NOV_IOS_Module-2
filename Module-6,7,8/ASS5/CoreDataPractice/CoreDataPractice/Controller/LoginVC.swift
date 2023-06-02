//
//  LoginVC.swift
//  CoreDataPractice
//
//  Created by MAC on 28/03/23.
//

import Foundation
import UIKit
import CoreData


class LoginVC: UIViewController {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var vwName: UIView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var vwMobile: UIView!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblAccount: UILabel!
    @IBOutlet weak var btnSignup: UIButton!
    
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        
        login()
        
    }
    
    @IBAction func btnSignupTapped(_ sender: Any) {
        
        signup()
        
    }
    
    func signup() {
        
        let signupVC = storyboard?.instantiateViewController(withIdentifier: "StudentVC") as! StudentVC
        self.navigationController?.pushViewController(signupVC, animated: true)
        
    }
    
    func login() {
        
        let Name = txtName.text!
        let Mobile = txtMobile.text!
        
        if self.txtName.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please Enter Name", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
            }
        if self.txtMobile.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please Enter Mobile", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
            }
        else
        {
          
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Studinfo")
            req.predicate = NSPredicate(format: "name = %@", Name)
            
            do {
               
                let result = try context.fetch(req)
                
                for data in result as! [NSManagedObject] {
                    let nameData = data.value(forKey: "name") as! String
                    let mobileData = data.value(forKey: "mobile") as! Int
                    
                   if Name == nameData && Int(Mobile) == mobileData {
                    
                    txtName.text=""
                    txtMobile.text=""
                    
                    UserDefaults.standard.setValue(true, forKey: "cuser")
                    
                    let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                    navigationController?.pushViewController(homeVC, animated: true)
                    
                    }
                    
                   else {
                    
                    let alert = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        self.dismiss(animated: true, completion: nil)
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                    
                   }
                }
                
            }
            catch {
                
                print(error.localizedDescription)
                
            }
            
            
        }
        
    }
    
    func Setup() {
        
        self.imgProfile.image = UIImage(named: "Profile")
        
        self.txtName.placeholder = "Enter Name"
        
        self.txtMobile.placeholder = "Enter Mobile Number"
        
        self.btnLogin.setTitle("Login", for: .normal)
        
        self.btnSignup.setTitle("SignUp", for: .normal)
        
        self.lblAccount.text = "Don't Have an Account?"
        
    }
    
    func Applystyle() {
        
        self.vwName.layer.borderColor = UIColor.darkGray.cgColor
        self.vwName.layer.borderWidth = 1.0
        
        self.vwMobile.layer.borderColor = UIColor.darkGray.cgColor
        self.vwMobile.layer.borderWidth = 1.0
        
        self.btnLogin.backgroundColor = .red
        self.btnLogin.tintColor = .black
        
        self.btnSignup.tintColor = .blue
        
        DispatchQueue.main.async {
            
            self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.height / 2
            
            self.vwName.layer.cornerRadius = self.vwName.frame.size.height / 2
            
            self.vwMobile.layer.cornerRadius = self.vwMobile.frame.size.height / 2
            
            self.btnLogin.layer.cornerRadius = self.btnLogin.frame.size.height / 2
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Setup()
        
        Applystyle()
        
        if UserDefaults.standard.bool(forKey: "cuser")==true
        {
            let homeVC=self.storyboard?.instantiateViewController(identifier: "HomeVC") as! HomeVC
            homeVC.modalPresentationStyle = .fullScreen
            self.present(homeVC, animated: true, completion: nil)
        }
        
    }
    
}
