//
//  ImgPicVC.swift
//  M4ASS7
//
//  Created by MAC on 04/02/23.
//  Make an app to take three imageview and three button then pickup images from gallery and show image within particular image view.

import Foundation
import UIKit



class ImgPicVC: UIViewController {
    
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    
    @IBAction func btn1Tapped(_ sender: Any) {
        
        let photo=UIImagePickerController()
        photo.delegate=self
        present(photo, animated: true, completion: nil)
        
    }
    
    @IBAction func btn2Tapped(_ sender: Any) {
        
        let photo=UIImagePickerController()
        photo.delegate=self
        present(photo, animated: true, completion: nil)
        
    }
    
    @IBAction func btn3Tapped(_ sender: Any) {
        
        let photo=UIImagePickerController()
        photo.delegate=self
        present(photo, animated: true, completion: nil)
        
    }
    
    func setUp() {
        
        self.btn1.setTitle("PIC 1", for: .normal)
        
        self.btn2.setTitle("PIC 2", for: .normal)
        
        self.btn3.setTitle("PIC 3", for: .normal)
        
    }
    
    func applyStyle() {
        
        self.img1.backgroundColor = .red
        
        self.img2.backgroundColor = .green
        
        self.img3.backgroundColor = .brown
        
        self.btn1.setTitleColor(UIColor.white, for: .normal)
        self.btn1.backgroundColor = .black
        
        self.btn2.setTitleColor(UIColor.black, for: .normal)
        self.btn2.backgroundColor = .brown
        
        self.btn3.setTitleColor(UIColor.blue, for: .normal)
        self.btn3.backgroundColor = .red
        
        DispatchQueue.main.async {
            self.img1.layer.cornerRadius = self.img1.frame.size.height / 2
            self.img2.layer.cornerRadius = self.img2.frame.size.height / 2
            self.img3.layer.cornerRadius = self.img3.frame.size.height / 2
            self.btn1.layer.cornerRadius = self.btn1.frame.size.height / 2
            self.btn2.layer.cornerRadius = self.btn2.frame.size.height / 2
            self.btn3.layer.cornerRadius = self.btn3.frame.size.height / 2
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUp()
        
        self.applyStyle()
        
    }
}

extension ImgPicVC:UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
     
        let img=info[.originalImage] as! UIImage
        img1.image = img
        img2.image = img
        img3.image = img
        dismiss(animated: true, completion: nil)
    }
}
