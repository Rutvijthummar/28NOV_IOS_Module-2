//
//  SecondVC.swift
//  M4ASS17
//
//  Created by MAC on 25/05/23.
//

import Foundation
import UIKit


class SecondVC: UIViewController {
    
    @IBOutlet weak var imgViewSeVC: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        imgViewSeVC.image = UIImage.init(named: "img2")
        imgViewSeVC.contentMode = .scaleAspectFill
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
        
    }
}
