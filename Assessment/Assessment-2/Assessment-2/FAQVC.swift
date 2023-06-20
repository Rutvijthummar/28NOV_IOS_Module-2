//
//  FAQVC.swift
//  Assessment-2
//
//  Created by MAC on 15/06/23.
//

import Foundation
import UIKit


class FAQVC: UIViewController {
    
    @IBOutlet weak var tblFAQ: UITableView!
    
    var label = ["Learning Licence", "Driving Licence", "Registration of Vehicle", "Fitness of Vehicle", "Permit", "PUC"]
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.tblFAQ.delegate = self
        self.tblFAQ.dataSource = self
        
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

extension FAQVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQCellVC", for: indexPath) as! FAQCellVC
        cell.lblTitle.text = label[indexPath.row]
        return cell
    }
    
}
