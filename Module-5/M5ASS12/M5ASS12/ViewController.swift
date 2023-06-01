//
//  ViewController.swift
//  M5ASS12
//
//  Created by MAC on 20/05/23.
//  Make an app to set tab bar controller with navigation bar and create
//  five tab in viewcontroller

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.backgroundColor = .white
        tabBarController?.tabBar.backgroundColor = UIColor.white
        
    }
    
    
    @IBAction func btnTap(_ sender: Any) {
        
        let vc = ViewController()
        vc.view.backgroundColor = .systemRed
        navigationController?.pushViewController(vc, animated: true)
        
    }
    

}

