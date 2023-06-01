//
//  TableVC.swift
//  M5ASS3
//
//  Created by MAC on 24/02/23.
//  Make an app to set accessory in tableview cell.

import Foundation
import UIKit



class TableVC: UIViewController {
    
    
    @IBOutlet weak var tblData: UITableView!
    
    var City = ["Ahmedabad", "Rajkot", "Surat", "Baroda", "Junagadh", "Morbi", "Jamnagar", "Bhavnagar", "Kutch", "Somnath", "Dwarka", "Diu", "Surendranagar", "Vyara", "Bardoli", "Saputara", "Mehsana", "Dahod", "Godhra", "Palnpur", "Anand", "Nadiad", "Bharuch", "Amereli"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblData.delegate = self
        self.tblData.dataSource = self
        
         let nib = UINib(nibName: "AccessoryCell", bundle: nil)
         self.tblData.register(nib, forCellReuseIdentifier: "AccessoryCell")
        
        
    }
}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return City.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccessoryCell", for: indexPath) as! AccessoryCell
        cell.textLabel?.text = City[indexPath.row]
        cell.accessoryType = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tblData.cellForRow(at: indexPath)?.accessoryType == .checkmark
            {
            tblData.cellForRow(at: indexPath)?.accessoryType = .none
            }
        else
        {
            tblData.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tblData.deselectRow(at: indexPath, animated: true)
    }
    
    
}

/*
 let nib = UINib(nibName: "TableCellVC", bundle: nil)
  self.tblData.register(nib, forCellReuseIdentifier: "TableCellVC")
 */
