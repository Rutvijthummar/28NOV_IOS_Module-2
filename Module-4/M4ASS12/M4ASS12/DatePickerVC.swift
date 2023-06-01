//
//  DatePickerVC.swift
//  M4ASS12
//
//  Created by MAC on 07/02/23.
//  Make an app to take date and time from datepicker and show in label.

import Foundation
import UIKit



class DatePickerVC: UIViewController {
    
    
    @IBOutlet weak var vwDateAndTime: UIView!
    @IBOutlet weak var txtDateAndTime: UITextField!
    @IBOutlet weak var lblData: UILabel!
    
    let pickerDate = UIDatePicker()
    
    func birth() {
        
        let currentDate = Date()
        let cal = Calendar(identifier: .gregorian)
        print(currentDate)
        
        
        self.txtDateAndTime.inputView = pickerDate
        if #available(iOS 13.4, *) {
            self.pickerDate.preferredDatePickerStyle = .wheels
        }else {
            
        }
        self.pickerDate.datePickerMode = .dateAndTime
        self.pickerDate.minimumDate = cal.date(byAdding: .year, value: -72, to: currentDate)
        self.pickerDate.maximumDate = currentDate
        
        self.pickerDate.addTarget(self, action: #selector(self.setDatePicked(_:)), for: .valueChanged)
    }
    
    @objc func setDatePicked(_ picker: UIDatePicker) {
        let dt = picker.date
        print(dt)
        let formatDate = DateFormatter()
        //formatDate.dateFormat = "dd MMM yyyy hh"
        formatDate.dateFormat="dd-MM-yyyy hh:mm a"
       // self.txtBirthDate.text = formatDate.string(from: dt)
        self.lblData.text = formatDate.string(from: dt)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtDateAndTime.placeholder = "Date Of Birth"
        
        self.lblData.text = "Date"
        self.lblData.textColor = .brown
        self.lblData.font = UIFont.systemFont(ofSize: 25)
        
        self.vwDateAndTime.layer.borderColor = UIColor.darkGray.cgColor
        self.vwDateAndTime.layer.borderWidth = 1.0
        
        DispatchQueue.main.async {
            self.vwDateAndTime.layer.cornerRadius = self.vwDateAndTime.frame.size.height / 2
        }
        
        self.birth()
        
        
    }
}
