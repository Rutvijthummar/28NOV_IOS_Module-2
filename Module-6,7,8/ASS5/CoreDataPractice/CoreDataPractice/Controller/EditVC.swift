//
//  EditVC.swift
//  CoreDataPractice
//
//  Created by MAC on 31/03/23.
//

import Foundation
import UIKit
import CoreData

class EditVC: UIViewController {
    
    @IBOutlet weak var lblEdit: UILabel!
    @IBOutlet weak var vwName: UIView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var vwSubject: UIView!
    @IBOutlet weak var txtSubject: UITextField!
    @IBOutlet weak var vwEmail: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var vwMobile: UIView!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnUpdate: UIButton!
    
    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func btnUpdateTapped(_ sender: Any) {
        
        Update()
        
    }
    
    func Update() {
        
        let req=NSFetchRequest<NSManagedObject>.init(entityName: "Studinfo")
        let pre=NSPredicate(format: "name=%@", txtName.text!)
        req.predicate=pre
        
        do
        {
            let data=try context.fetch(req) as! [NSManagedObject]
            if data.count>=1
            {
                let update=data[0]
                update.setValue(txtSubject.text!, forKey: "subject")
                update.setValue(txtEmail.text!, forKey: "email")
                
                
                try context.save()
                let alert=UIAlertController(title: "Update", message: "Your data has been updated!", preferredStyle: .alert)
                let ok=UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                    
                    let showdataVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowDataVC") as! ShowDataVC
                    self.navigationController?.pushViewController(showdataVC, animated: true)
                    
                })
                let more=UIAlertAction(title: "MORE", style: .destructive, handler: nil)
                alert.addAction(ok)
                alert.addAction(more)
                present(alert, animated: true, completion: nil)
                
                
            }
            
        }
        catch
        {
            let alert=UIAlertController(title: "Error", message:error.localizedDescription, preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            let more=UIAlertAction(title: "MORE", style: .destructive, handler: nil)
            alert.addAction(ok)
            alert.addAction(more)
            present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
    func SetUp() {
        
        self.lblEdit.text = "Edit Info"
        
        self.imgProfile.image = UIImage(named: "Profile")
        
        self.txtSubject.placeholder = "Enter Subject"
        
        self.txtEmail.placeholder = "Enter Email"
        
        self.btnUpdate.setTitle("Update", for: .normal)
        
    }
    
    func ApplyStyle() {
        
        self.vwName.layer.borderColor = UIColor.darkGray.cgColor
        self.vwName.layer.borderWidth = 1.0
        
        self.vwSubject.layer.borderColor = UIColor.darkGray.cgColor
        self.vwSubject.layer.borderWidth = 1.0
        
        self.vwEmail.layer.borderColor = UIColor.darkGray.cgColor
        self.vwEmail.layer.borderWidth = 1.0
        
        self.vwMobile.layer.borderColor = UIColor.darkGray.cgColor
        self.vwMobile.layer.borderWidth = 1.0
        
        self.btnUpdate.backgroundColor = .green
        self.btnUpdate.tintColor = .black
        
        DispatchQueue.main.async {
            
            self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.height / 2
            
            self.vwName.layer.cornerRadius = self.vwName.frame.size.height / 2
            
            self.vwSubject.layer.cornerRadius = self.vwSubject.frame.size.height / 2
            
            self.vwEmail.layer.cornerRadius = self.vwEmail.frame.size.height / 2
            
            self.vwMobile.layer.cornerRadius = self.vwMobile.frame.size.height / 2
            
            self.btnUpdate.layer.cornerRadius = self.btnUpdate.frame.size.height / 2
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SetUp()
        
        self.ApplyStyle()
        
    }
    
}
