//
//  MapVC.swift
//  ASS1
//
//  Created by MAC on 01/06/23.
//

import Foundation
import UIKit
import WebKit

class MapVC: UIViewController {
    
    @IBOutlet weak var countryMap: WKWebView!
    
    var mapURL=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url=URL(string: mapURL)
        let urlReq=URLRequest(url: url!)
        countryMap.load(urlReq)

        
    }
    
}
