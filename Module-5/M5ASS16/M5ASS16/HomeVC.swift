//
//  HomeVC.swift
//  M5ASS16
//
//  Created by MAC on 24/05/23.
//

import Foundation
import UIKit


class HomeVC: UIViewController {
    
    
    @IBAction func btnNextTapped(_ sender: Any) {
        
        let vc: InformationVC = storyboard?.instantiateViewController(withIdentifier: "InformationVC") as! InformationVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
