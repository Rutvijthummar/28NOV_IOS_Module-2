//
//  StatesVC.swift
//  M5ASS14
//
//  Created by MAC on 23/05/23.
//  Make an app to get data from plist and display in tableview.

import Foundation
import UIKit

class StatesVC: UIViewController {
    
    @IBOutlet weak var tblStates: UITableView!
    
    var states = [String]()
    var capitals = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblStates.delegate = self
        self.tblStates.dataSource = self
        
        let path = Bundle.main.path(forResource: "MyPlist", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        states = dict?.object(forKey: "States") as! [String]
        capitals = dict?.object(forKey: "Capitals") as! [String]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CapitalsVC {
            
            destination.data = capitals[tblStates.indexPathForSelectedRow!.row]
            
        }
    }
    
}

extension StatesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = states[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segue", sender: self)
    } 
    
    
}
