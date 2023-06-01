//
//  TableVC.swift
//  M2ASS5
//
//  Created by MAC on 27/02/23.
//  Make an app to set delete button in each cell.

import Foundation
import UIKit



class TableVC: UIViewController {
    
    @IBOutlet weak var tblData: UITableView!
    
    var arrName = ["Rutvij", "Jhangir", "Dharmesh", "Prit", "Raj", "Fenil", "Aman", "Dhairya", "Nirav", "Yogiraj"]
    
    var arrSubject = ["IOS", "Android", "Flutter", "React", "MySql", "Graphics", "Java", "PHP", "Python", "Web Design"]
    
    var arrCity = ["Junagadh", "Morbi", "Jamnagar", "Upleta", "Rajkot", "Kalawad", "Ahmedabad", "Baroda", "Surat", "Bhavnagar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblData.delegate = self
        self.tblData.dataSource = self
        
        let nib = UINib(nibName: "DeleteCellVC", bundle: nil)
        self.tblData.register(nib, forCellReuseIdentifier: "DeleteCellVC")
        
    }
}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeleteCellVC", for: indexPath) as! DeleteCellVC
        cell.lblName.text = arrName[indexPath.row]
        cell.lblSubject.text = arrSubject[indexPath.row]
        cell.lblCity.text = arrCity[indexPath.row]
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(TableVC.handlerRegister), for: .touchUpInside)
        return cell
    }
    
    @objc func handlerRegister(_ sender: UIButton) {
        arrName.remove(at: sender.tag)
        tblData.deleteRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
        tblData.reloadData()
    }
    
    
}


    
    

