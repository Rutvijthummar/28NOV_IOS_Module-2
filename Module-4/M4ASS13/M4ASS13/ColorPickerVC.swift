//
//  ColorPickerVC.swift
//  M4ASS13
//
//  Created by MAC on 07/02/23.
//  Make an app to display color name in pickerview, select a color then changed view background color as per selection.

import Foundation
import UIKit



class ColorPickerVC: UIViewController {
    
    
    @IBOutlet weak var vwColor: UIView!
    @IBOutlet weak var txtColor: UITextField!
    
    let pickerColor = UIPickerView()
    var arrColor = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrColor = ["Red", "Yellow", "Blue", "Black", "Green", "Pink", "Orange", "Gray", "Brown", "Purple", "Teal"]
        
        self.vwColor.layer.borderColor = UIColor.darkGray.cgColor
        self.vwColor.layer.borderWidth = 1.0
        
        self.txtColor.placeholder = "Pick Color"
        self.txtColor.inputView = pickerColor
        
        self.pickerColor.delegate = self
        self.pickerColor.dataSource = self
        
        DispatchQueue.main.async {
            self.vwColor.layer.cornerRadius = self.vwColor.frame.size.height / 2
        }
        
        
    }
}

extension ColorPickerVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrColor.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrColor[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0{
                    view.backgroundColor = .red
                }else if row == 1{
                    view.backgroundColor = .yellow
                }else if row == 2{
                    view.backgroundColor = .blue
                }else if row == 3{
                    view.backgroundColor = .black
                }else if row == 4{
                    view.backgroundColor = .green
                }else if row == 5 {
                    view.backgroundColor = .systemPink
                }else if row == 6 {
                    view.backgroundColor = .orange
                }else if row == 7 {
                    view.backgroundColor = .gray
                }else if row == 8 {
                    view.backgroundColor = .brown
                }else if row == 9 {
                    view.backgroundColor = .purple
                }else if row == 10 {
                    view.backgroundColor = .systemTeal
                }else {
                    view.backgroundColor = .white
                }
    }
    
    
    
}
