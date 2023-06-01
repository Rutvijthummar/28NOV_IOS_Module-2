//
//  DatePickerVC.swift
//  M4ASS10
//
//  Created by MAC on 07/02/23.
//  Make an app to take a date from datepicker and display in label.

import Foundation
import UIKit


class DatePickerVC: UIViewController {
    
    
    @IBOutlet weak var vwDate: UIView!
    @IBOutlet weak var txtBirthDate: UITextField!
    @IBOutlet weak var lblData: UILabel!
    
    let pickerDate = UIDatePicker()
    
    func birth() {
        
        let currentDate = Date()
        let cal = Calendar(identifier: .gregorian)
        print(currentDate)
        
        
        self.txtBirthDate.inputView = pickerDate
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
       // self.txtBirthDate.text = formatDate.string(from: dt)
        self.lblData.text = formatDate.string(from: dt)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtBirthDate.placeholder = "Date Of Birth"
        
        self.lblData.text = "Date"
        self.lblData.textColor = .brown
        self.lblData.font = UIFont.systemFont(ofSize: 25)
        
        self.vwDate.layer.borderColor = UIColor.darkGray.cgColor
        self.vwDate.layer.borderWidth = 1.0
        
        DispatchQueue.main.async {
            self.vwDate.layer.cornerRadius = self.vwDate.frame.size.height / 2
        }
        
        self.birth()
        
    }
}
