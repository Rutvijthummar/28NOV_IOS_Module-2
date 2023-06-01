//
//  ViewController.swift
//  M4ASS17
//
//  Created by MAC on 25/05/23.
//  Make an app to customize navigation bar with all properties.

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.image = UIImage.init(named: "img1")
        imgView.contentMode = .scaleAspectFill
        
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 0, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            let secondFrame = CGRect(x: navigationBar.frame.width/2, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)

            let firstLabel = UILabel(frame: firstFrame)
            firstLabel.text = " Hey Guest User!"

            let secondLabel = UILabel(frame: secondFrame)
            secondLabel.text = "              Warm Welcome"

            navigationBar.addSubview(firstLabel)
            navigationBar.addSubview(secondLabel)
        }
        
    }

    @IBAction func btnNext(_ sender: Any) {
        
        let nav = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
        self.navigationController?.pushViewController(nav!, animated: true)
        
    }
    
}

