//
//  CountryVC.swift
//  ASS1
//
//  Created by MAC on 01/06/23.
//  display content of the following api into table view https://restcountries.com/v3.1/all

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


class CountryVC: UIViewController {
    
    @IBOutlet weak var tblCountry: UITableView!
    
    var apidata=[APIModel]()
    
    func fetchAPIData()
    {
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else
        {
            print("Invalid URL")
            return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do
            {
                let json=try JSON(data: data!)
                
                let dtArray=json.array?.count
                
                for i in 0..<dtArray!
                {
                    let nm=json[i]["name"]["common"].stringValue
                    let reg=json[i]["region"].stringValue
                    let map=json[i]["maps"]["googleMaps"].stringValue
                    let flg=json[i]["flags"]["png"].stringValue
                    let latitude = json[i]["latlng"][0].doubleValue
                    let longitude = json[i]["latlng"][1].doubleValue
                    
                    //self.apidata.append((APIModel(name: nm, region: reg, maps: map, flags: flg)))
                    self.apidata.append(APIModel(name: nm, region: reg, latitude: latitude, longitude: longitude, maps: map, flags: flg))
                }
                DispatchQueue.main.async {
                    print(self.apidata)
                    self.tblCountry.reloadData()
                }
                
                
            }
            catch
            {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblCountry.delegate = self
        self.tblCountry.dataSource = self
        
        let nib = UINib(nibName: "CountryCell", bundle: nil)
        self.tblCountry.register(nib, forCellReuseIdentifier: "CountryCell")
        
        fetchAPIData()
        
    }
    
}

extension CountryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apidata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        cell.lblName.text = apidata[indexPath.row].name
        cell.lblRegion.text = apidata[indexPath.row].region
        cell.imgFlag?.kf.setImage(with: URL(string: apidata[indexPath.row].flags!))
        cell.lblLati.text = String(apidata[indexPath.row].latitude)
        cell.lblLogi.text = String(apidata[indexPath.row].longitude)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "MapVC") as! MapVC
        vc.mapURL=apidata[indexPath.row].maps!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
