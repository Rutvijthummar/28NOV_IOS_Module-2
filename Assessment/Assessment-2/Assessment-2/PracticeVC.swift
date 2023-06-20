//
//  PracticeVC.swift
//  Assessment-2
//
//  Created by MAC on 17/06/23.
//

import Foundation
import UIKit


class PraticeVC: UIViewController {
    
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        DispatchQueue.main.async {
            self.btnA.layer.cornerRadius = self.btnA.frame.size.height / 2
            self.btnB.layer.cornerRadius = self.btnB.frame.size.height / 2
            self.btnC.layer.cornerRadius = self.btnC.frame.size.height / 2
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
