//
//  TableVC.swift
//  M5ASS7
//
//  Created by MAC on 21/03/23.
//  Make an app to show multiple button in cell when swap
//  uitableviewcell.

import Foundation
import UIKit


class TableVC: UIViewController {
    
    @IBOutlet weak var tblData: UITableView!
    
    var FullName = [""]
    
    var Subject = [""]
    
    var City = [""]
    
    var Email = [""]
    var Mobile = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FullName = ["Rutvij", "Raj", "Jhangir", "Dharmesh", "Aman", "Nirav", "Yogiraj","kishan"]
        
        Subject = ["IOS", "MYSQL", "Android", "Python", "Flutter", "WebDesign", "PHP","laravel"]
        
        City = ["Rajkot", "Surat", "Morbi", "Jamngar", "Ahmedabad", "Baroda", "Navsari","junagadh"]
        
        Email = ["rutvij@gmail.com", "raj@gmail.com", "jhangir@gmail.com", "dharmesh@gmail.com", "aman@gmail.com", "nirav@gmail.com", "yogiraj@gmail.com","kp21043@gmail.com"]
        
        Mobile = ["1234567890", "0987654321", "1209345678", "1230984567", "1234509876", "1245783690", "1230987654","6354222297"]
        
        self.tblData.delegate = self
        self.tblData.dataSource = self
        
        let nib = UINib(nibName: "DataCellVC", bundle: nil)
        self.tblData.register(nib, forCellReuseIdentifier: "DataCellVC")
        
    }
}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FullName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCellVC", for: indexPath) as! DataCellVC
        cell.lblFullName.text = FullName[indexPath.row]
        cell.lblSubject.text = Subject[indexPath.row]
        cell.lblCity.text = City[indexPath.row]
        cell.lblEmail.text = Email[indexPath.row]
        cell.lblMobileNumber.text = Mobile[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let more = UIContextualAction(style: .normal, title: "More") { (_, _, _) in
            print("More Button Tapped")
        }
        more.backgroundColor = .blue
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [more])
        return swipeConfiguration
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (_, _, _) in
            print("Edit Button Tapped")
        }
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
            print("Delete Button Tapped")
        }
        edit.backgroundColor = .green
        delete.backgroundColor = .red
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [delete, edit])
        return swipeConfiguration
    }
    
}
