//
//  TableVC.swift
//  M5ASS2
//
//  Created by MAC on 24/02/23.
//  Make an app to display data in section wise.

import Foundation
import UIKit



class TableVC: UIViewController {
    
    
    @IBOutlet weak var tblData: UITableView!
    
    var InformationBook = [
        
        Information(name: "Student Name", list: ["Rutvij", "Raj", "Dharmesh", "Jhangir", "Aman"]),
        Information(name: "City Name", list: ["Rajkot", "Surat", "Baroda", "Morbi", "Ahmedabad"]),
        Information(name: "Subject Name", list: ["IOS", "SQL", "Java", "Android", "Python"])
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblData.delegate = self
        self.tblData.dataSource = self
        
    }
}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return InformationBook.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return InformationBook[section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InformationBook[section].list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblData.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        cell.textLabel?.text = InformationBook[indexPath.section].list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .yellow
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .orange
    }
    
}
