//
//  PickerVC.swift
//  M4ASS11
//
//  Created by MAC on 07/02/23.
//  Make an app to display list of courses in pickerview.

import Foundation
import UIKit



class PickerVC: UIViewController {
    
    
    @IBOutlet weak var vwCourse: UIView!
    @IBOutlet weak var txtCourse: UITextField!
    
    let pickerCourse = UIPickerView()
    var arrSubject = [""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.vwCourse.layer.borderColor = UIColor.darkGray.cgColor
        self.vwCourse.layer.borderWidth = 1.0
        
        DispatchQueue.main.async {
            self.vwCourse.layer.cornerRadius = self.vwCourse.frame.size.height / 2
        }
        
        arrSubject = ["IOS", "JAVA", "PHP", "ANDROID", "C++", "REACT", "REACT-NATIVE", "NODEJS", "C-SHARP", "MYSQL", "WEB-DESIGN"]
        
        self.txtCourse.placeholder = "Subject"
        self.txtCourse.inputView = pickerCourse
        self.pickerCourse.delegate = self
        self.pickerCourse.dataSource = self
        
        
        
    }
}

extension PickerVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrSubject.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrSubject[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtCourse.text = arrSubject[row]
        
        self.view.endEditing(true)
        self.txtCourse.isUserInteractionEnabled=false
        
    }
    
    
    
}
