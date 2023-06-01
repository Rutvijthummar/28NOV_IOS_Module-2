//
//  DataVC.swift
//  M5ASS15
//
//  Created by MAC on 24/05/23.
//  Make an app to clear all key and value permanently in ios.

import Foundation
import UIKit


class DataVC: UIViewController {
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    
    
    
    @IBAction func btnSubmitTapped(_ sender: Any) {
        
        btnSubmit()
        
    }
    
    func btnSubmit() {
        
        if txtCity.text != "" || txtName.text != "" {
            UserDefaults.standard.set(txtName.text, forKey: "name")
            UserDefaults.standard.set(txtCity.text, forKey: "city")
            // Create new Alert
            let dialogMessage = UIAlertController(title: "Yes", message: "Datails Stored Successfully", preferredStyle: .alert)
             
             // Create OK button with action handler
             let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                 print("Ok button tapped")
              })
             
             //Add OK button to a dialog message
             dialogMessage.addAction(ok)

             // Present Alert to
             self.present(dialogMessage, animated: true, completion: nil)
         } else {
             // Create new Alert
             let dialogMessage = UIAlertController(title: "Oops", message: "Any textfield should not be empty", preferredStyle: .alert)
             
             // Create OK button with action handler
             let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                 print("Ok button tapped")
              })
             
             //Add OK button to a dialog message
             dialogMessage.addAction(ok)

             // Present Alert to
             self.present(dialogMessage, animated: true, completion: nil)
             
         }
        
    }
    
    func btnRemove() {
        
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "city")
        let dialogMessage = UIAlertController(title: "Woah", message: "Datails deleted Successfully", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)

        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
        lbl1.text = "Oops! No Data Here"
        lbl2.text = "Oops! No Data Here"
    
   
        
    }
    
    @IBAction func btnRemoveTapped(_ sender: Any) {
        
        self.btnRemove()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value1 =  UserDefaults.standard.string(forKey: "name")
         let value2 = UserDefaults.standard.string(forKey: "city")
         
         if value1 != nil && value2 != nil {
             lbl1.text = "Hello \(value1 ?? "")"
             lbl2.text = "Your city Name is \(value2 ?? "")"
         }
        
    }
    
}
