//
//  FormsVC.swift
//  Assessment-2
//
//  Created by MAC on 20/06/23.
//

import Foundation
import UIKit
import WebKit


class FormsVC: UIViewController {
    
    
    @IBOutlet weak var webForms: WKWebView!
    
    var RTOForms = "https://parivahan.gov.in/parivahan//en/content/driving-licence-0#"
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let url=URL(string: RTOForms)
        let urlReq=URLRequest(url: url!)
        webForms.load(urlReq)
        
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
