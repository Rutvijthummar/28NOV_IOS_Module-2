//
//  ViewController.swift
//  M5ASS9
//
//  Created by MAC on 24/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblViewOutlet: UITableView!
    
    var mainDictionary : [String : [(String,String)]] = ["Indian Army" : [("arm1", "1"), ("arm2","2"), ("arm3","3"), ("arm4","4"), ("arm5","5"), ("arm6","6")],
                                                         "Indian Airforce" : [("af1","1"), ("af2", "2"), ("af3","3"), ("af4","4"), ("af5","5"), ("af6","6")],
                                                         "Indian Navy" : [("in1","1"), ("in2","2"), ("in3","3"), ("in4","4"), ("in5","5"), ("in6","6"), ("in7","7")],
                                                         "Enforcement Department" : [("ed1","1"), ("ed2","2"), ("ed3","3")],
                                                         "CBI" : [("cbi1","1"), ("cbi2", "2")],
                                                         "Gujarat Police" : [("gp1","1"), ("gp2","2"), ("gp3","3"), ("gp5","5"), ("gp6","6")],
                                                         "Para SF" : [("psf1","1"), ("psf2","2"), ("psf3","3"), ("psf4","4")],
                                                         "RAW" : [("r1", "1"), ("r2", "2"), ("r3", "3"), ("r4", "4")]
    ]
    var arrOfMainTitle = ["Indian Army", "Indian Airforce", "Indian Navy", "Enforcement Department", "CBI", "Gujarat Police", "Para SF", "RAW"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tblViewOutlet.delegate = self
        self.tblViewOutlet.dataSource = self
        
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfMainTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblCell") as? TableViewCell
        cell?.arrOfImageAndLabel = mainDictionary[arrOfMainTitle[indexPath.row]] ?? []
        cell?.lblOfTableView.text = arrOfMainTitle[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
    
    
}


