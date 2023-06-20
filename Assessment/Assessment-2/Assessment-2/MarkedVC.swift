//
//  MarkedVC.swift
//  Assessment-2
//
//  Created by MAC on 19/06/23.
//

import Foundation
import UIKit


class MarkedVC: UIViewController {
    
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBOutlet weak var btnMark: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        DispatchQueue.main.async {
            self.btnMark.layer.cornerRadius = self.btnMark.frame.size.height / 2
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}
