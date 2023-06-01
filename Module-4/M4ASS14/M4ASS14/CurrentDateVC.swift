//
//  CurrentDateVC.swift
//  M4ASS14
//
//  Created by MAC on 15/02/23.
//  Make an app to compare a current date to selected date from datepicker.

import Foundation
import UIKit

class CurrentDateVC: UIViewController {
    
    
    @IBOutlet weak var lblCurrentDate: UILabel!
    @IBOutlet weak var lblSelectDate: UILabel!
    @IBOutlet weak var lblForResult: UILabel!
    @IBOutlet weak var txtField: UITextField!
    
    var datePicker = UIDatePicker()
    let curDate = Date()
    var Selecteddt = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dtfrm2 = DateFormatter()
        dtfrm2.dateStyle = .long
        dtfrm2.dateFormat = "yyyy-MM-dd"
        let dateTimeStr = dtfrm2.string(from: curDate)
        lblCurrentDate.text = "Current Date is : \(dateTimeStr)"
        
    }
    
    
    func temp() {
        txtField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.addTarget(self, action: #selector(CurrentDateVC.selectDatee), for: .valueChanged)
        
     
    }
    @objc func selectDatee() {
        Selecteddt = datePicker.date
        let dtfm = DateFormatter()
        dtfm.dateStyle = .long
        dtfm.dateFormat = "yyyy-MM-dd"
        lblSelectDate.text = "Selected Date is: \(dtfm.string(from: Selecteddt))"
        view.endEditing(true)
    }

    
    
    @IBAction func btnCompare(_ sender: Any) {
        
        if lblCurrentDate.text == lblSelectDate.text {
            lblForResult.text = "Both Date are same"
            print(Selecteddt)
           
        } else  {
            lblForResult.text = "Current and Selected Date are NOT SAME"
            
            print(Selecteddt)
        }
    }
        
    
}
