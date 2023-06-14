//
//  NotesVC.swift
//  Assessment-1
//
//  Created by MAC on 13/06/23.
//

import Foundation
import UIKit

class NotesVC: UIViewController {
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var tvNotes: UITextView!
    @IBOutlet weak var imgData: UIImageView!
    
    
    @IBAction func btnImagTapped(_ sender: Any) {
        
        let photo=UIImagePickerController()
        photo.delegate=self
        present(photo, animated: true, completion: nil)
        
    }
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtTitle.becomeFirstResponder()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapeSave))
    
    }
    
    @objc func didTapeSave() {
        
        let notesInfo = "insert into NotesInfo(Text, Image)Values('\(tvNotes.text!)', '\(imgData.image!)')"
        
        print(notesInfo)
        
        let dml=DMLoperation()
        let result=dml.dmlservices(query: notesInfo)
        
        if result==true
        {
            let alert=UIAlertController(title: "Success", message: "Signup successfull!🎭", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler:{ACTION in
                
                self.navigationController?.popViewController(animated: true)
                
            })
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            
            if let text = txtTitle.text, !text.isEmpty, !tvNotes.text.isEmpty {
                completion?(text, tvNotes.text)
            }
            
        }
        else
        {
            let alert=UIAlertController(title: "Error", message:"Somthing went wrong...Try again!😕", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            let more=UIAlertAction(title: "MORE", style: .destructive, handler: nil)
            alert.addAction(ok)
            alert.addAction(more)
            present(alert, animated: true, completion: nil)
            
            if let text = txtTitle.text, !text.isEmpty, !tvNotes.text.isEmpty {
                completion?(text, tvNotes.text)
            }
            
        }
        
      /*  if let text = txtTitle.text, !text.isEmpty, !tvNotes.text.isEmpty {
            completion?(text, tvNotes.text)
        } */
        
        
    }
    
}

extension NotesVC:UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
     
        let img=info[.originalImage] as! UIImage
        imgData.image = img
        dismiss(animated: true, completion: nil)
    }
}
