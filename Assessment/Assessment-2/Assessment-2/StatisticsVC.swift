//
//  StatisticsVC.swift
//  Assessment-2
//
//  Created by MAC on 20/06/23.
//

import Foundation
import UIKit
import WebKit


class StatisticsVC: UIViewController {
    
    @IBOutlet weak var webRTO: WKWebView!
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    var RtoUrl = "https://morth.nic.in/sites/default/files/RTYB-2017-18-2018-19.pdf"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let url=URL(string: RtoUrl)
        let urlReq=URLRequest(url: url!)
        webRTO.load(urlReq)
        
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
