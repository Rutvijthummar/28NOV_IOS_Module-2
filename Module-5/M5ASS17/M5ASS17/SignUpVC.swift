//
//  SignUpVC.swift
//  M5ASS17
//
//  Created by MAC on 18/04/23.
//  Make an app to create registration form and perform validation
//  using textfield validator

import Foundation
import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var lblCreateAccount: UILabel!
    @IBOutlet weak var lblAccountInfo: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var vwFullName: UIView!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var vwEmail: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var vwMobileNumber: UIView!
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var vwBirthDate: UIView!
    @IBOutlet weak var txtBirthDate: UITextField!
    @IBOutlet weak var vwCreatePassword: UIView!
    @IBOutlet weak var txtCreatePassword: UITextField!
    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var vwConfirmPassword: UIView!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnEye1: UIButton!
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var lblTermAndCondition: UILabel!
    @IBOutlet weak var btnDone: UIButton!
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @IBAction func btnEyeTapped(_ sender: Any) {
        
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if(sender as! UIButton).isSelected {
            self.txtCreatePassword.isSecureTextEntry = false
            btnEye.setImage(UIImage(named: "Eye"), for: .normal)
        }
        else {
            self.txtCreatePassword.isSecureTextEntry = true
            btnEye.setImage(UIImage(named: "Hide Eye"), for: .normal)
        }
        
    }
    
    @IBAction func btnEye1Tapped(_ sender: Any) {
        
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if(sender as! UIButton).isSelected {
            self.txtConfirmPassword.isSecureTextEntry = false
            btnEye1.setImage(UIImage(named: "Eye"), for: .normal)
        }
        else {
            self.txtConfirmPassword.isSecureTextEntry = true
            btnEye1.setImage(UIImage(named: "Hide Eye"), for: .normal)
        }
        
    }
    
    @IBAction func btnCheckBoxTapped(_ sender: Any) {
        
        if (self.btnCheckBox.isSelected == true)
            {
            self.btnCheckBox.setImage(UIImage(named: "Logo"), for: .normal)

                 self.btnCheckBox.isSelected = false;
           }
           else
           {
                self.btnCheckBox.setImage(UIImage(named: "Square"), for: .normal)
                self.btnCheckBox.isSelected = true;
            }
        
    }
    
    @IBAction func btnDoneTapped(_ sender: Any) {
        
        self.Done()
        
    }
    
    func Done() {
        
        if self.txtFullName.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please Enter Full Name", preferredStyle: .alert)
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
                   let alert = UIAlertController(title: "Alert", message: "Please enter valid email", preferredStyle: .alert)
                          let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
               }
                   alert.addAction(actionOK)
                   self.present(alert, animated: true, completion: nil)
               }
        if self.txtCode.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please Enter Country Code", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
            }
        if self.txtMobile.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please Enter Mobile Number", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
            }
        if self.txtBirthDate.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please Select Birth Date", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
            }
        if self.txtCreatePassword.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please Create Password", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
            }
        if self.txtConfirmPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please Enter Confirm Password", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
            }
        if self.txtCreatePassword.text != self.txtConfirmPassword.text {
            let alert = UIAlertController(title: "Alert", message: "Please Check The Password", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            
            let alert=UIAlertController(title: "SIGNUP", message: "SignUp Succesfully!", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func SetUp() {
        
        self.lblCreateAccount.text = "Create Account"
        
        self.lblAccountInfo.text = "We Need Your Account Information."
        
        self.imgProfile.image = UIImage(named: "Profile")
        
        self.txtFullName.placeholder = "Full Name"
        
        self.txtEmail.placeholder = "Email"
        
        self.txtCode.placeholder = "+91"
        
        self.txtMobile.placeholder = "Mobile Number"
        
        self.txtBirthDate.placeholder = "BirthDate"
        
        self.txtCreatePassword.placeholder = "Create Password"
        
        self.txtConfirmPassword.placeholder = "Confirm Password"
        
        self.lblTermAndCondition.text = "Agree with Terms & Condition and Privacy Policy"
        
        self.btnDone.setTitle("Done", for: .normal)
        
    
    }
    
    func ApplyStyle() {
        
        self.lblCreateAccount.textColor = .black
        
        self.lblAccountInfo.textColor = .darkGray
        
        self.lblAccountInfo.numberOfLines = 0
        
        self.vwFullName.layer.borderColor = UIColor.darkGray.cgColor
        self.vwFullName.layer.borderWidth = 1.0
        
        self.vwEmail.layer.borderColor = UIColor.darkGray.cgColor
        self.vwEmail.layer.borderWidth = 1.0
        
        self.vwMobileNumber.layer.borderColor = UIColor.darkGray.cgColor
        self.vwMobileNumber.layer.borderWidth = 1.0
        
        self.vwBirthDate.layer.borderColor = UIColor.darkGray.cgColor
        self.vwBirthDate.layer.borderWidth = 1.0
        
        self.vwCreatePassword.layer.borderColor = UIColor.darkGray.cgColor
        self.vwCreatePassword.layer.borderWidth = 1.0
        
        self.vwConfirmPassword.layer.borderColor = UIColor.darkGray.cgColor
        self.vwConfirmPassword.layer.borderWidth = 1.0
        
        self.lblTermAndCondition.numberOfLines = 0
        
        let string = "Agree with Terms & Condition and Privacy Policy"
        let attributedstring = NSMutableAttributedString(string: string)
        
        let firstattribute: [NSMutableAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray]
        let secondattribute: [NSMutableAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "ThemeGreen"), .underlineStyle: 1]
        let thirdattribute: [NSMutableAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray]
        let fourthattribute: [NSMutableAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "ThemeGreen"), .underlineStyle: 1]
        
        attributedstring.addAttributes(firstattribute, range: NSRange(location: 0, length: 10))
        attributedstring.addAttributes(secondattribute, range: NSRange(location: 11, length: 17))
        attributedstring.addAttributes(thirdattribute, range: NSRange(location: 29, length: 3))
        attributedstring.addAttributes(fourthattribute, range: NSRange(location: 33, length: 14))
        
        self.lblTermAndCondition.attributedText = attributedstring
        
        self.btnDone.backgroundColor = UIColor(named: "ThemeGreen")
        self.btnDone.tintColor = .white
        
        self.btnDone.layer.borderColor = UIColor.darkGray.cgColor
        self.btnDone.layer.borderWidth = 1.0
        
        DispatchQueue.main.async {
            
            self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.height / 2
            
            self.vwFullName.layer.cornerRadius = self.vwFullName.frame.size.height / 2
            
            self.vwEmail.layer.cornerRadius = self.vwEmail.frame.size.height / 2
            
            self.vwMobileNumber.layer.cornerRadius = self.vwMobileNumber.frame.size.height / 2
            
            self.vwBirthDate.layer.cornerRadius = self.vwBirthDate.frame.size.height / 2
            
            self.vwCreatePassword.layer.cornerRadius = self.vwCreatePassword.frame.size.height / 2
            
            self.vwConfirmPassword.layer.cornerRadius = self.vwConfirmPassword.frame.size.height / 2
        
            self.btnDone.layer.cornerRadius = self.btnDone.frame.size.height / 2
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SetUp()
        
        self.ApplyStyle()
        
    }
    
}
