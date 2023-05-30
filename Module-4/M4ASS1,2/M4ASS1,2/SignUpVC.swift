//
//  SignUpVC.swift
//  M4ASS1,2
//
//  Created by MAC on 28/01/23.
//

import Foundation
import UIKit


class SignUpVC: UIViewController, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var lblCreateAccount: UILabel!
    @IBOutlet weak var lblInformation: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var vwName: UIView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var vwEmail: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var vwMobile: UIView!
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var vwBirth: UIView!
    @IBOutlet weak var txtDateOfBirth: UITextField!
    @IBOutlet weak var vwCreatePassword: UIView!
    @IBOutlet weak var txtCreatePassword: UITextField!
    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var vwConfirmPassword: UIView!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnEye1: UIButton!
    @IBOutlet weak var vwCity: UIView!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var btnLogo: UIButton!
    @IBOutlet weak var lblTermAndCondition: UILabel!
    @IBOutlet weak var btnSignIn: UIButton!
    
    let pickerDate = UIDatePicker()
    
    let pickerCity = UIPickerView()
    let arrCity = ["Ahmedabad", "Surat", "Vadodara", "Rajkot", "Bhavanagr", "Jamnagar", "Gadhinagar", "Junagadh", "Gadhidham", "Anand", "Navasari", "Morbi", "Nadidad", "Surendranagar", "Mehasana", "Bharuch", "Bhuj", "Porabandar", "Palanpur", "Valsad", "Vapi", "Gondal", "Veraval", "Godhara", "Patan", "Kalol", "Dahod", "Botad", "Amereli", "Deesa", "Jetpur"]
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func btnEyeTapped(_ sender: Any) {
        
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if(sender as! UIButton).isSelected {
            self.txtCreatePassword.isSecureTextEntry = false
            btnEye.setImage(UIImage(named: "Eye"), for: .normal)
        }
        else {
            self.txtCreatePassword.isSecureTextEntry = true
            btnEye.setImage(UIImage(named: "Eye1"), for: .normal)
        }
        
    }
    
    @IBAction func btnEye1Tapped(_ sender: Any) {
        
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if(sender as! UIButton).isSelected {
            self.txtCreatePassword.isSecureTextEntry = false
            btnEye1.setImage(UIImage(named: "Eye"), for: .normal)
        }
        else {
            self.txtCreatePassword.isSecureTextEntry = true
            btnEye1.setImage(UIImage(named: "Eye1"), for: .normal)
        }
        
    }
    
    @IBAction func btnLogoTapped(_ sender: Any) {
        
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if(sender as! UIButton).isSelected {
            btnLogo.setImage(UIImage(named: "Logo-1"), for: .normal)
        }
        else {
            btnLogo.setImage(UIImage(systemName: "square"), for: .normal)
        }
        
    }
    

    @IBAction func btnSignInTapped(_ sender: Any) {
        
        if self.imgProfile.image == nil {
            let alert = UIAlertController(title: "Create Account", message: "Please Upload Profile Picture", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
    
        if self.txtName.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Create Account", message: "Please Enter Name", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        if self.txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Create Account", message: "Please Enter Email", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        if  !self.isValidEmail(self.txtEmail.text!){
                   let alert = UIAlertController(title: "Create Account", message: "Please enter valid enter email", preferredStyle: .alert)
                          let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
               }
                   alert.addAction(actionOK)
                   self.present(alert, animated: true, completion: nil)
               }
        if self.txtCode.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Create Account", message: "Please Enter Code", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        if self.txtMobileNumber.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Create Account", message: "Please Enter Mobile Number", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        if self.txtDateOfBirth.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Create Account", message: "Please Select Date Of Birth", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        if self.txtCreatePassword.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Create Account", message: "Please Craete Password", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        if self.txtConfirmPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Create Account", message: "Please Enter Confirm Password", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        if self.txtCreatePassword.text != self.txtConfirmPassword.text {
            let alert = UIAlertController(title: "Create Account", message: "Please Check The Password", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        if self.txtCity.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: "Create Account", message: "Please Select City", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        if self.btnLogo.isSelected == false {
            let alert = UIAlertController(title: "Create Account", message: "Please Accept Term & Condition", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Create Account", message: "SignIn Succesfully", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    let imgpickerController = UIImagePickerController()
    
    func openimgPickerController() {
        
        self.imgpickerController.allowsEditing = true
        
        let alert = UIAlertController(title: "Alert", message: "Please Select Image", preferredStyle: .actionSheet)
        
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imgpickerController.sourceType = .camera
                self.present(self.imgpickerController, animated: true, completion: nil)
            }
            else {
                let alert = UIAlertController(title: "Alert", message: "Camera not Found", preferredStyle: .alert)
                let actionok = UIAlertAction(title: "ok", style: .default)
                alert.addAction(actionok)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        let actionGallery = UIAlertAction(title: "Galllery", style: .default) { action in
            self.imgpickerController.sourceType = .photoLibrary
            self.present(self.imgpickerController, animated: true, completion: nil)
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
        }
        alert.addAction(actionCamera)
        alert.addAction(actionGallery)
        alert.addAction(actionCancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func callImgAction() {
        self.openimgPickerController()
    }
    
    func setUp() {
        
        self.lblCreateAccount.text = "Create Account"
        
        self.lblInformation.text = "We need your account information"
        self.lblInformation.numberOfLines = 0
        
        self.txtName.placeholder = "Enter Name"
        self.txtName.keyboardType = .default
        
        self.txtEmail.placeholder = "Enter Email"
        self.txtEmail.keyboardType = .emailAddress
        
        self.txtCode.placeholder = "Code"
        self.txtCode.keyboardType = .numberPad
        
        self.txtMobileNumber.placeholder = "Mobile Number"
        self.txtMobileNumber.keyboardType = .phonePad
        
        self.txtDateOfBirth.placeholder = "Date Of Birth"
        
        self.txtCreatePassword.placeholder = "Create Password"
        self.txtCreatePassword.keyboardType = .default
        self.txtCreatePassword.isSecureTextEntry = true
        
        self.txtConfirmPassword.placeholder = "Confirm Password"
        self.txtConfirmPassword.keyboardType = .default
        self.txtConfirmPassword.isSecureTextEntry = true
        
        self.txtCity.placeholder = "City"
        self.txtCity.inputView = pickerCity
        
        self.lblTermAndCondition.text = "Agree with Terms & Condition and Privacy Policy"
        self.lblTermAndCondition.numberOfLines = 0
        
        let string = "Agree with Terms & Condition and Privacy Policy"
        let attributedstring = NSMutableAttributedString(string: string)
        
        let firstattribute: [NSMutableAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray]
        let secondattribute: [NSMutableAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "Theme Green"), .underlineStyle: 1]
        let thirdattribute: [NSMutableAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray]
        let fourthattribute: [NSMutableAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "Theme Green"), .underlineStyle: 1]
        
        attributedstring.addAttributes(firstattribute, range: NSRange(location: 0, length: 10))
        attributedstring.addAttributes(secondattribute, range: NSRange(location: 11, length: 17))
        attributedstring.addAttributes(thirdattribute, range: NSRange(location: 29, length: 3))
        attributedstring.addAttributes(fourthattribute, range: NSRange(location: 33, length: 14))
        
        self.lblTermAndCondition.attributedText = attributedstring
        
        self.btnSignIn.setTitle("SignIn", for: .normal)
        
        self.txtName.delegate = self
        self.txtEmail.delegate = self
        self.txtCode.delegate = self
        self.txtMobileNumber.delegate = self
        self.txtDateOfBirth.delegate = self
        self.txtCreatePassword.delegate = self
        self.txtConfirmPassword.delegate = self
        self.txtCity.delegate = self
        self.pickerCity.delegate = self
        self.pickerCity.dataSource = self
        
    }
    
    func applyStyle() {
        
        self.lblCreateAccount.font = UIFont.boldSystemFont(ofSize: 25)
        self.lblCreateAccount.textColor = UIColor.black
        
        self.lblInformation.textColor = UIColor.darkGray
        
        self.vwName.layer.borderColor = UIColor.darkGray.cgColor
        self.vwName.layer.borderWidth = 1.0
        
        self.vwEmail.layer.borderColor = UIColor.darkGray.cgColor
        self.vwEmail.layer.borderWidth = 1.0
        
        self.vwMobile.layer.borderColor = UIColor.darkGray.cgColor
        self.vwMobile.layer.borderWidth = 1.0
        
        self.vwBirth.layer.borderColor = UIColor.darkGray.cgColor
        self.vwBirth.layer.borderWidth = 1.0
        
        self.vwCreatePassword.layer.borderColor = UIColor.darkGray.cgColor
        self.vwCreatePassword.layer.borderWidth = 1.0
        
        self.vwConfirmPassword.layer.borderColor = UIColor.darkGray.cgColor
        self.vwConfirmPassword.layer.borderWidth = 1.0
        
        self.vwCity.layer.borderColor = UIColor.darkGray.cgColor
        self.vwCity.layer.borderWidth = 1.0
        
        self.btnSignIn.setTitleColor(.white, for: .normal)
        
        DispatchQueue.main.async {
            self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.height / 2
            self.vwName.layer.cornerRadius = self.vwName.frame.size.height / 2
            self.vwEmail.layer.cornerRadius = self.vwEmail.frame.size.height / 2
            self.vwMobile.layer.cornerRadius = self.vwMobile.frame.size.height / 2
            self.vwBirth.layer.cornerRadius = self.vwBirth.frame.size.height / 2
            self.vwCreatePassword.layer.cornerRadius = self.vwCreatePassword.frame.size.height / 2
            self.vwConfirmPassword.layer.cornerRadius = self.vwConfirmPassword.frame.size.height / 2
            self.vwCity.layer.cornerRadius = self.vwCity.frame.size.height / 2
            self.btnSignIn.layer.cornerRadius = self.btnSignIn.frame.size.height / 2
        }
        
    }
    
    func birth() {
        
        let currentDate = Date()
        let cal = Calendar(identifier: .gregorian)
        print(currentDate)
        
        
        self.txtDateOfBirth.inputView = pickerDate
        if #available(iOS 13.4, *) {
            self.pickerDate.preferredDatePickerStyle = .wheels
        }else {
            
        }
        self.pickerDate.datePickerMode = .date
        self.pickerDate.minimumDate = cal.date(byAdding: .year, value: -72, to: currentDate)
        self.pickerDate.maximumDate = currentDate
        
        self.pickerDate.addTarget(self, action: #selector(self.setDatePicked(_:)), for: .valueChanged)
    }
    
    @objc func setDatePicked(_ picker: UIDatePicker) {
        let dt = picker.date
        print(dt)
        let formatDate = DateFormatter()
        formatDate.dateFormat = "dd MMM yyyy"
        self.txtDateOfBirth.text = formatDate.string(from: dt)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgpickerController.delegate = self
        
        let taponImg = UITapGestureRecognizer(target: self, action: #selector(self.callImgAction))
        taponImg.numberOfTapsRequired = 1
        self.imgProfile.addGestureRecognizer(taponImg)
        
        
        self.setUp()
        
        self.applyStyle()
        
        self.birth()
        
    }
}

extension SignUpVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.txtName:
            self.txtEmail.becomeFirstResponder()
        case self.txtEmail:
            self.txtCode.becomeFirstResponder()
        case self.txtCode:
            self.txtMobileNumber.becomeFirstResponder()
        case self.txtMobileNumber:
            self.txtDateOfBirth.becomeFirstResponder()
        case self.txtDateOfBirth:
            self.txtCreatePassword.becomeFirstResponder()
        case self.txtCreatePassword:
            self.txtConfirmPassword.becomeFirstResponder()
        case self.txtConfirmPassword:
            self.txtCity.becomeFirstResponder()
        default:
            self.txtCity.resignFirstResponder()
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
        } else if textField == self.txtMobileNumber {
            let maxLength = 10
            let currentString: NSString = txtMobileNumber.text as! NSString
            let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
            
            
        }
        else {
            return true
        }
    }
    
}

extension SignUpVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrCity.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrCity[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtCity.text = arrCity[row]
    }
    
    
    
}

extension SignUpVC: UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancel Method Called")
              self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[.editedImage] as! UIImage
        self.dismiss(animated: true) {
            self.imgProfile.image = img
        }
    }
    
}




/*
 if !textField1.text.trimmingCharacters(in: .whitespaces).isEmpty {
     // string contains non-whitespace characters
 }
 */

/*
 if !txtName.text!.trimmingCharacters(in: .whitespaces).isEmpty{
     let alert = UIAlertController(title: "Create Account", message: "Please Enter Name", preferredStyle: .alert)
     let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
     }
     alert.addAction(actionOK)
     self.present(alert, animated: true, completion: nil)
 }
 if !txtEmail.text!.trimmingCharacters(in: .whitespaces).isEmpty{
     let alert = UIAlertController(title: "Create Account", message: "Please Enter Email", preferredStyle: .alert)
     let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
     }
     alert.addAction(actionOK)
     self.present(alert, animated: true, completion: nil)
 }
 if  !self.isValidEmail(self.txtEmail.text!){
            let alert = UIAlertController(title: "Create Account", message: "Please enter valid enter email", preferredStyle: .alert)
                   let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
        }
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
        }
 if !txtCode.text!.trimmingCharacters(in: .whitespaces).isEmpty{
     let alert = UIAlertController(title: "Create Account", message: "Please Enter Code", preferredStyle: .alert)
     let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
     }
     alert.addAction(actionOK)
     self.present(alert, animated: true, completion: nil)
 }
 if !txtMobileNumber.text!.trimmingCharacters(in: .whitespaces).isEmpty{
     let alert = UIAlertController(title: "Create Account", message: "Please Enter Mobile Number", preferredStyle: .alert)
     let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
     }
     alert.addAction(actionOK)
     self.present(alert, animated: true, completion: nil)
 }
 if !txtDateOfBirth.text!.trimmingCharacters(in: .whitespaces).isEmpty{
     let alert = UIAlertController(title: "Create Account", message: "Please Select Date of Birth", preferredStyle: .alert)
     let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
     }
     alert.addAction(actionOK)
     self.present(alert, animated: true, completion: nil)
 }
 if !txtCreatePassword.text!.trimmingCharacters(in: .whitespaces).isEmpty{
     let alert = UIAlertController(title: "Create Account", message: "Please Craete Password", preferredStyle: .alert)
     let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
     }
     alert.addAction(actionOK)
     self.present(alert, animated: true, completion: nil)
 }
 if !txtConfirmPassword.text!.trimmingCharacters(in: .whitespaces).isEmpty{
     let alert = UIAlertController(title: "Create Account", message: "Please Enter Confirm Password", preferredStyle: .alert)
     let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
     }
     alert.addAction(actionOK)
     self.present(alert, animated: true, completion: nil)
 }
 if self.txtCreatePassword.text != self.txtConfirmPassword.text {
     let alert = UIAlertController(title: "Create Account", message: "Please Check The Password", preferredStyle: .alert)
     let actionOK = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
     }
     alert.addAction(actionOK)
     self.present(alert, animated: true, completion: nil)
 }
 */

/*
 func isValidEmail(_ email: String) -> Bool {
     let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
     
     let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
     return emailPred.evaluate(with: email)
 }
 */
