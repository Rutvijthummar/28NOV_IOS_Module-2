//
//  ShowDataVC.swift
//  CrudOperation
//
//  Created by MAC on 15/03/23.
//

import Foundation
import UIKit

// MARK: - Class Of UiViewController -

class ShowDataVC: UIViewController {
    
    @IBOutlet weak var tblShowData: UITableView!
    @IBOutlet weak var vwFullName: UIView!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var vwCity: UIView!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var vwEmail: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var vwMobile: UIView!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var btnUpdate: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
// MARK: - Button Action Method -
    
    @IBAction func btnUpdateTapped(_ sender: Any) {
        
        self.Update()
        
    }
    
    @IBAction func btnDeleteTapped(_ sender: Any) {
        
        self.Delete()
        
    }
    
// MARK: - Custom Variable Declaration -
    
    var allData = Array<Any>()
    
    let dml = DMLOperations()
    
// MARK: - Custom Function Of Setup -
    
    func setUp() {
        
        self.txtFullName.placeholder = "Enter Full Name"
        
        self.txtCity.placeholder = "Enter City"
        
        self.txtEmail.placeholder = "Enter Email"
        
        self.txtMobileNumber.placeholder = "Enter Mobile Number"
        
        self.btnUpdate.setTitle("Update", for: .normal)
        
        self.btnDelete.setTitle("Delete", for: .normal)
        
    }
    
// MARK: - Custom Function Of ApplyStyle -
    
    func applyStyle() {
        
        self.vwFullName.layer.borderColor = UIColor.darkGray.cgColor
        self.vwFullName.layer.borderWidth = 1.0
        
        self.vwCity.layer.borderColor = UIColor.darkGray.cgColor
        self.vwCity.layer.borderWidth = 1.0
        
        self.vwEmail.layer.borderColor = UIColor.darkGray.cgColor
        self.vwEmail.layer.borderWidth = 1.0
        
        self.vwMobile.layer.borderColor = UIColor.darkGray.cgColor
        self.vwMobile.layer.borderWidth = 1.0
        
        self.btnUpdate.backgroundColor = .green
        self.btnUpdate.tintColor = .white
        
        self.btnDelete.backgroundColor = .red
        self.btnDelete.tintColor = .black
        
        DispatchQueue.main.async {
            
            self.vwFullName.layer.cornerRadius = self.vwFullName.frame.size.height / 2
            
            self.vwCity.layer.cornerRadius = self.vwCity.frame.size.height / 2
            
            self.vwEmail.layer.cornerRadius = self.vwEmail.frame.size.height / 2
            
            self.vwMobile.layer.cornerRadius = self.vwMobile.frame.size.height / 2
            
            self.btnDelete.layer.cornerRadius = self.btnDelete.frame.size.height / 2
            
            self.btnUpdate.layer.cornerRadius = self.btnUpdate.frame.size.height / 2
            
        }
        
    }
    
// MARK: - Custom Function Of Delete -
    
    func deleteData(txt: String) {
        
        print(txt)
        let delete_query = "delete from userinfo where fullname='\(txt)'"
        print(delete_query)
        let dml = DMLOperations()
        let result = dml.dmlservices(query: delete_query)
        
        if result==true
        {
            let alert=UIAlertController(title: "Delete", message: "Your data has been deleted!", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            fetchData()
            tblShowData.reloadData()
            txtFullName.text=""
        }
        else
        {
            let alert=UIAlertController(title: "Error", message: "Something went wrong...!", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            let more=UIAlertAction(title: "MORE", style: .destructive, handler: nil)
            alert.addAction(ok)
            alert.addAction(more)
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    
// MARK: - Custom Function Of FetchData -
    
    func fetchData() {
        
        let selectData = "select * from userinfo"
        allData = dml.showData(query: selectData)
        print(allData)
        
    }
    
// MARK: - Custom Function Of Update -
    
    func Update() {
        
        let update_query = "update userinfo set city='\(txtCity.text!)',email='\(txtEmail.text!)',mobile='\(txtMobileNumber.text!)' where fullname='\(txtFullName.text!)' "
        print(update_query)
        
        let result = dml.dmlservices(query: update_query)
        
        if result==true
        {
            let alert=UIAlertController(title: "Update", message: "Your data has been updated!", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            fetchData()
            tblShowData.reloadData()
            txtFullName.text=""
            txtCity.text=""
            txtEmail.text=""
            txtMobileNumber.text=""
        }
        else
        {
            let alert=UIAlertController(title: "Error", message: "Something went wrong...!", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            let more=UIAlertAction(title: "MORE", style: .destructive, handler: nil)
            alert.addAction(ok)
            alert.addAction(more)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
// MARK: - Custom Function Of Delete -
    
    func Delete() {
        
        let delete_query = "delete from userinfo where fullname='\(txtFullName.text!)'"
        print(delete_query)
        
        let result = dml.dmlservices(query: delete_query)
        
        if result==true
        {
            let alert=UIAlertController(title: "Delete", message: "Your data has been deleted!", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            fetchData()
            tblShowData.reloadData()
            txtFullName.text=""
        }
        else
        {
            let alert=UIAlertController(title: "Error", message: "Something went wrong...!", preferredStyle: .alert)
            let ok=UIAlertAction(title: "OK", style: .default, handler: nil)
            let more=UIAlertAction(title: "MORE", style: .destructive, handler: nil)
            alert.addAction(ok)
            alert.addAction(more)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
// MARK: - View Did Load Method -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ShowDataCell", bundle: nil)
         self.tblShowData.register(nib, forCellReuseIdentifier: "ShowDataCell")
        
        self.tblShowData.delegate = self
        self.tblShowData.dataSource = self
        
        self.tblShowData.backgroundColor = .green
        
        self.fetchData()
        
        self.setUp()
        
        self.applyStyle()
        
    }
}

// MARK: - Extesion Of UiTableViewContrller Delegate & DataSorce Mehod -

extension ShowDataVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dc = allData[indexPath.row] as! Dictionary<String,Any>
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowDataCell", for: indexPath) as! ShowDataCell
        cell.lblFullName.text = dc["fullname"] as? String
        cell.lblCity.text = dc["city"] as? String
        cell.lblEmail.text = dc["email"] as? String
        cell.lblMobile.text = dc["mobile"] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { (_, _, _) in
            print("Delte Button Tapped")
            let dc = self.allData[indexPath.row] as! Dictionary<String,Any>
            self.deleteData(txt: dc["fullname"] as? String ?? "")
        }
        
        delete.backgroundColor = .red
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [delete])
        return swipeConfiguration
    }
    
    
}
