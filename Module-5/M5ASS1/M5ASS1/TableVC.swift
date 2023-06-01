//
//  TableVC.swift
//  M5ASS1
//
//  Created by MAC on 23/02/23.
//  Make an app to display simple array item in tableview

import Foundation
import UIKit



class TableVC: UIViewController {
    
    @IBOutlet weak var tblData: UITableView!
    
   var arrCity = ["Ahmedabad", "Gandhinagar", "Rajkot", "Bhavnagar", "Surat", "Vadodara", "Jamnagar", "Junagadh", "Gandhidham", "Anand", "Navsari", "Morbi", "Nadiad", "Surendranagar", "Bharuch", "Mehsana", "Bhuj", "Porbandar", "Palanpur", "Valsad", "Vapi", "Gondal", "Veraval", "Godhra", "Patan", "Kalol", "Dahod", "Botad", "Amreli", "Deesa", "Jetpur"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblData.delegate = self
        self.tblData.dataSource = self
        
    }
}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCellVC", for: indexPath) as! DataCellVC
        cell.lblData.text = arrCity[indexPath.row]
        return cell
    }
    
}
