//
//  PickerVC.swift
//  M4ASS15
//
//  Created by MAC on 16/02/23.
//  Make an app to take country, state picker when user select country then respected state will be shown(take a single pickerview) to navigate from one page to another page using segue to perform navigation using four page(using push, pop Methodology.

import Foundation
import UIKit

struct Country {
    var country : String
    var state : [String] = []
}

class PickerVC: UIViewController {
    
    @IBOutlet weak var vwCountry: UIView!
    @IBOutlet weak var txtCountryPicker: UITextField!
    
    var countryPicker = UIPickerView()
  //  var pickerData : [countryData] = []
    var selectCoutry = [Country]()
   /* var arrOfCountry = ["India", "America", "Russia", "England", "Canada"]
    var arrOfState = ["Delhi", "Washington", "Moscow", "London", "Ottawa"] */


    

  var dataDisplay = [Country(country: "India", state: ["Delhi", "Gujarat"]),
                     Country(country: "Canada", state: ["Ottawa", "Jaipur"]),
                     Country(country: "America", state: ["Washington", "Ahmedabad"]),
                     Country(country: "Russia", state: ["Moscow", "Weligton"]),
                     Country(country: "England", state: ["London", "Bihar"])]
    
    var countrySelected : Int   = 0
    var stateSelected : Int     = 0
    
 /*   struct stateData {
        
       var state : [String] = []
        
    }
    
    struct countryData {
        
        var country : String
        var selecteState: [stateData] = []
    }
    
    var displayData = countryData(country: "India", selecteState: "Delhi") */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtCountryPicker.placeholder = "Country"
        
        self.vwCountry.layer.borderColor = UIColor.darkGray.cgColor
        self.vwCountry.layer.borderWidth = 1.0
        
        DispatchQueue.main.async {
            self.vwCountry.layer.cornerRadius = self.vwCountry.frame.size.height / 2
        }
        
        
        self.txtCountryPicker.inputView = countryPicker
        self.countryPicker.delegate = self
        self.countryPicker.dataSource = self
        
    }
}

extension PickerVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component
        {
        case 0:
            return selectCoutry.count
        case 1:
            return selectCoutry[countrySelected].state.count
        default:
                return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component
        {
        case 0:
            return selectCoutry[row].country
        case 1:
            return selectCoutry[countrySelected].state[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component
        {
        case 0:
            countrySelected = pickerView.selectedRow(inComponent: 0)
            stateSelected = 0
            
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
            pickerView.reloadComponent(2)
            pickerView.selectRow(0, inComponent: 2, animated: true)
            
        case 1:
            stateSelected = pickerView.selectedRow(inComponent: 1)
            
            pickerView.reloadComponent(2)
            pickerView.selectRow(0, inComponent: 2, animated: true)
            
        default:
            break

        }
    }
    
    
}
