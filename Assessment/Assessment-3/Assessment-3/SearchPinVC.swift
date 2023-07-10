//
//  SearchPinVC.swift
//  Assessment-3
//
//  Created by MAC on 21/06/23.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


class SearchPinVC: UIViewController {
    
    @IBOutlet weak var tblPin: UITableView!
    
    var postoffice: [PostOffice] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       fetchData()
        
    }

    func fetchData() {
        
        let url = URL(string: "https://api.postalpincode.in/pincode/360005")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do
            {
                let decoder = JSONDecoder()
                let response = try decoder.decode(APIResponse.self, from: data!)
                               
                print(response)
            }
            catch
            {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
    
    
}
