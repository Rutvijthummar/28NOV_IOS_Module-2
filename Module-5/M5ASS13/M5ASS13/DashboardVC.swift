//
//  DashboardVC.swift
//  M5ASS13
//
//  Created by MAC on 22/05/23.
//  Make an app to hide tab bar panel in specific viewcontroller like login and registration.

import Foundation
import UIKit


class DashboardVC: UIViewController {
    
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func btnNext(_ sender: Any) {
        
        let nav = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        nav?.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(nav ?? UIViewController(), animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = UIImage(named: "Welcome")
        tabBarController?.tabBar.backgroundColor = UIColor.white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
              super.viewWillAppear(animated)
              self.tabBarController?.tabBar.isHidden = false
          
          }
    
    
}
