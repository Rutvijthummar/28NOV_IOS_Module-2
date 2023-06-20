//
//  DrivingVC.swift
//  Assessment-2
//
//  Created by MAC on 17/06/23.
//

import Foundation
import UIKit


class DrivingVC: UIViewController {
    
    @IBOutlet weak var tblProcess: UITableView!
    
    var process = ["New Driving Licence", "Addition of another category in the exisiting driving licence", "Renewal of Driving Licence", "For change in details of driving licence or obtaining a duplicate", "International Driving Licence or Permit", "Driving Licence delivered"]
    
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.tblProcess.delegate = self
        self.tblProcess.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

extension DrivingVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return process.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrivingCellVC", for: indexPath) as! DrivingCellVC
        cell.lblProcess.text = process[indexPath.row]
        return cell
    }
    
    
    
    
}
