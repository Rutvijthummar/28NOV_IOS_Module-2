//
//  TableVC.swift
//  API_JSON
//
//  Created by MAC on 04/04/23.
//

import Foundation
import UIKit


class TableVC: UIViewController {
    
    @IBOutlet weak var tblData: UITableView!
    
    var apiData = Array<Any>()
    
    func FetchApi() {
        
        let url = URL(string: "https://restcountries.com/v2/all")
        
        do
        {
            
            let dt = try Data(contentsOf: url!)
            apiData = try JSONSerialization.jsonObject(with: dt, options: []) as! [Any]
            print(apiData)
            
            
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
        
        let nib = UINib(nibName: "countryCell", bundle: nil)
        self.tblData.register(nib, forCellReuseIdentifier: "countryCell")
        
        FetchApi()
        
    }
    
}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return apiData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! countryCell
        let dict = apiData[indexPath.row] as! Dictionary <String,Any>
        cell.lblCountry.text = dict["name"] as? String
        cell.lblCapital.text = dict["capital"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = apiData[indexPath.row] as! Dictionary<String,Any>
        let alert=UIAlertController(title:dict["name"] as? String, message:String(dict["population"] as! Int), preferredStyle: .alert)
        let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
        let more=UIAlertAction(title: "MORE", style: .destructive, handler: nil)
        alert.addAction(ok)
        alert.addAction(more)
        present(alert, animated: true, completion: nil)
    }
    
    
}
