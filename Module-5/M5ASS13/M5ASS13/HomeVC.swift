//
//  HomeVC.swift
//  M5ASS13
//
//  Created by MAC on 22/05/23.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    
    
    @IBOutlet weak var imgVieww: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgVieww.image = UIImage(named: "Aboutus")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           self.tabBarController?.tabBar.isHidden = false
       
       }
    
    
}
