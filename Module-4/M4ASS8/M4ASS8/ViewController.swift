//
//  ViewController.swift
//  M4ASS8
//
//  Created by MAC on 25/05/23.
//  Make an app to take two textfield in which first textfield can take value from keyboard where as other has not.

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtFieldOne: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtFieldOne.isUserInteractionEnabled = true
        txtField2.isUserInteractionEnabled = false
        
    }


}

