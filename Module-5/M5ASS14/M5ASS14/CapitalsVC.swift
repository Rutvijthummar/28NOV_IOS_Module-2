//
//  CapitalsVC.swift
//  M5ASS14
//
//  Created by MAC on 23/05/23.
//

import Foundation
import UIKit


class CapitalsVC: UIViewController {
    
    
    @IBOutlet weak var lblCapitals: UILabel!
    
    var data = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblCapitals.text = data
        
    }
    
}
