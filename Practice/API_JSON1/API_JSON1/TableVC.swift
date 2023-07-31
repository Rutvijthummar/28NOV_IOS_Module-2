//
//  TableVC.swift
//  API_JSON1
//
//  Created by MAC on 04/04/23.
//

import Foundation
import UIKit

struct apiData:Decodable {
    var name:String?
    var capital:String?
}


class TableVC: UIViewController {
    
    @IBOutlet weak var tblData: UITableView!
    
    var apiArray = [apiData]()
    
    func FetchApi() {
        
        let url = URL(string: "https://restcountries.com/v2/all")
        
        do
        {
            
            let dt = try Data(contentsOf: url!)
            apiArray = try JSONDecoder().decode([apiData].self, from: dt)
            print(apiArray)
            
        }
        catch
        {
            print(error.localizedDescription)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FetchApi()
        
        self.tblData.delegate = self
        self.tblData.dataSource = self
        
        let nib = UINib(nibName: "countryCell", bundle: nil)
        self.tblData.register(nib, forCellReuseIdentifier: "countryCell")
        
    }
    
}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! countryCell
        cell.lblCountry.text = apiArray[indexPath.row].name
        cell.lblCapital.text = apiArray[indexPath.row].capital
        return cell
    }
    
    
    
    
}
