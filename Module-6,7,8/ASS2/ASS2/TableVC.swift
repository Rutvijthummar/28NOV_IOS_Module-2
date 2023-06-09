//
//  TableVC.swift
//  ASS2
//
//  Created by MAC on 02/06/23.
//  using get method display following data on table https://jsonplaceholder.typicode.com/comments?po stId=1 

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


class TableVC: UIViewController {
    
    @IBOutlet weak var tblData: UITableView!
    
    var apidata=[APIModel]()
    
    func Information() {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments?")
        do
        {
            let dt = try Data(contentsOf: url!)
            let json = try! JSON(data: dt)
            
            let arrayCount = json.array?.count ?? 0
            
            for i in 0..<arrayCount {
                
                let nm = json[i]["name"].string ?? "N/A"
                
                let em = json[i]["email"].string ?? "N/A"
                
                let bd = json[i]["body"].string ?? "N/A"
                
                apidata.append(APIModel(name: nm, email: em, body: bd))
                
            }
            
            DispatchQueue.main.async {
                print(self.apidata)
                self.tblData.reloadData()
            }
            
        }
        
        catch
        {
            print(error.localizedDescription)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblData.delegate = self
        self.tblData.dataSource = self
        
        Information()
        
        let nib = UINib(nibName: "InformationCell", bundle: nil)
        self.tblData.register(nib, forCellReuseIdentifier: "InformationCell")
        
    }
}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apidata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCell", for: indexPath) as! InformationCell
        cell.lblName.text = apidata[indexPath.row].name
        cell.lblEmail.text = apidata[indexPath.row].email
        cell.lblBody.text = apidata[indexPath.row].body
        return cell
    }
    
}
