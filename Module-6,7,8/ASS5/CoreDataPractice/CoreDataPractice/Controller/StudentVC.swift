//
//  StudentVC.swift
//  CoreDataPractice
//
//  Created by MAC on 22/03/23.
//  make an app for CRUD operation for core data 

import Foundation
import UIKit

class StudentVC: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var vwName: UIView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var vwSubject: UIView!
    @IBOutlet weak var txtSubject: UITextField!
    @IBOutlet weak var vwEmail: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var vwMobile: UIView!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnShowData: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @IBAction func btnSaveTapped(_ sender: Any) {
        
        if self.txtName.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please Enter Name", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
            }
        if self.txtSubject.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please Enter Subject", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
            }
        if self.txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please Enter Email", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
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
        if self.txtMobile.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please Enter Mobile", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
            }
        
        else {
            getdata()
        }
        
    }
    
    @IBAction func btnShowDataTapped(_ sender: Any) {
        
            ShowData()
    
    }
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func ShowData() {
        
        let showdataVC = storyboard?.instantiateViewController(withIdentifier: "ShowDataVC") as! ShowDataVC
        self.navigationController?.pushViewController(showdataVC, animated: true)
        
    }
    
    func getdata() {
        
        let stdata = ["name":txtName.text!,
                      "subject":txtSubject.text!,
                      "email":txtEmail.text!,
        "mobile":Int(txtMobile.text!)!] as [String : Any]
        
        let dml = DMLOperation()
        dml.savedata(data: stdata)
        
        do
        {
            try context.save()
            let alert=UIAlertController(title: "Success", message: "Your data has been saved!", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            
            txtName.text=""
            txtSubject.text=""
            txtEmail.text=""
            txtMobile.text=""
            
        }
        catch
        {
            print(error.localizedDescription)
            let alert=UIAlertController(title: "Error", message: "Something went wrong....", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    func Setup() {
        
        self.imgProfile.image = UIImage(named: "Profile")
        
        self.txtName.placeholder = "Enter Name"
        
        self.txtSubject.placeholder = "Enter Subject"
        
        self.txtEmail.placeholder = "Enter Email"
        
        self.txtMobile.placeholder = "Enter Mobile Number"
        
        self.btnSave.setTitle("Save", for: .normal)
        
        self.btnShowData.setTitle("ShowData", for: .normal)
        
        self.btnLogin.setTitle("Login", for: .normal)
        
        self.txtName.delegate = self
        self.txtSubject.delegate = self
        self.txtEmail.delegate = self
        self.txtMobile.delegate = self
        
    }
    
    func Applystyle() {
        
        self.vwName.layer.borderColor = UIColor.darkGray.cgColor
        self.vwName.layer.borderWidth = 1.0
        
        self.vwSubject.layer.borderColor = UIColor.darkGray.cgColor
        self.vwSubject.layer.borderWidth = 1.0
        
        self.vwEmail.layer.borderColor = UIColor.darkGray.cgColor
        self.vwEmail.layer.borderWidth = 1.0
        
        self.vwMobile.layer.borderColor = UIColor.darkGray.cgColor
        self.vwMobile.layer.borderWidth = 1.0
        
        self.btnSave.backgroundColor = .black
        self.btnSave.tintColor = .white
        
        self.btnShowData.backgroundColor = .green
        self.btnShowData.tintColor = .white
        
        self.btnLogin.backgroundColor = .red
        self.btnLogin.tintColor = .black
        
        DispatchQueue.main.async {
            
            self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.height / 2
            
            self.vwName.layer.cornerRadius = self.vwName.frame.size.height / 2
            
            self.vwSubject.layer.cornerRadius = self.vwSubject.frame.size.height / 2
            
            self.vwEmail.layer.cornerRadius = self.vwEmail.frame.size.height / 2
            
            self.vwMobile.layer.cornerRadius = self.vwMobile.frame.size.height / 2
            
            self.btnSave.layer.cornerRadius = self.btnSave.frame.size.height / 2
            
            self.btnShowData.layer.cornerRadius = self.btnShowData.frame.size.height / 2
            
            self.btnLogin.layer.cornerRadius = self.btnLogin.frame.size.height / 2
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path=NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print(path)
        
        self.Setup()
        
        self.Applystyle()
        
    }
    
}

extension StudentVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.txtName:
            self.txtSubject.becomeFirstResponder()
        case self.txtSubject:
            self.txtEmail.becomeFirstResponder()
        case self.txtEmail:
            self.txtMobile.becomeFirstResponder()
        default:
            self.txtMobile.resignFirstResponder()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.txtName {
            let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            return alphabet
        } else if textField == self.txtMobile {
            let maxLength = 10
            let currentString: NSString = txtMobile.text! as NSString
            let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }else {
            return true
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == self.txtSubject {
                   if txtName.text!.isEmpty {
                   return false
                }
               }else if textField == self.txtEmail {
                       if txtSubject.text!.isEmpty {
                   return false
                }
               }else if textField == self.txtMobile {
                   if txtEmail.text!.isEmpty {
                   return false
                }
               }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtName{
            
            self.txtSubject.text?.removeAll()
            self.txtEmail.text?.removeAll()
            self.txtMobile.text?.removeAll()
            
        }else if textField == txtSubject{
            
            self.txtEmail.text?.removeAll()
            self.txtMobile.text?.removeAll()
            
        }else if textField == txtEmail{
            
            self.txtMobile.text?.removeAll()
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        return
    }
    
}
