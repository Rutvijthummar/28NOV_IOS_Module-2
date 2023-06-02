//
//  ShowDataVC.swift
//  CoreDataPractice
//
//  Created by MAC on 30/03/23.
//

import Foundation
import UIKit


class ShowDataVC: UIViewController, UISearchBarDelegate, UISearchControllerDelegate {
    
    @IBOutlet weak var tblShowData: UITableView!
    
    let dml = DMLOperation()
    var allData = [Studinfo]()
    var mysearch=UISearchController(searchResultsController: nil)
    
    func setupSearchbar()
    {
        mysearch.searchResultsUpdater=self
        mysearch.delegate=self
        navigationItem.searchController=mysearch
    }
    
    func DisplayData() {
        
        allData = dml.showdata()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblShowData.delegate = self
        self.tblShowData.dataSource = self
        
         let nib = UINib(nibName: "ShowDataCell", bundle: nil)
         self.tblShowData.register(nib, forCellReuseIdentifier: "ShowDataCell")
        
        DisplayData()
        setupSearchbar()
        
    }
    
}

extension ShowDataVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowDataCell", for: indexPath) as! ShowDataCell
        cell.lblName.text = allData[indexPath.row].name
        cell.lblSubject.text = allData[indexPath.row].subject
        cell.lblEmail.text = allData[indexPath.row].email
        cell.lblMobile.text=String(Int(allData[indexPath.row].mobile))
        cell.btnEdit.tag = indexPath.row
        cell.btnEdit.addTarget(self, action: #selector(ShowDataVC.editData(_:)), for: .touchUpInside)
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(ShowDataVC.deletedata(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func editData(_ sender: UIButton) {
        
        let n = sender.tag
        
        if (sender.tag == n)
             {
            let editVC = storyboard?.instantiateViewController(withIdentifier: "EditVC") as! EditVC
            self.navigationController?.pushViewController(editVC, animated: true)
             }
        
    }
    
    @objc func deletedata(_ sender: UIButton) {
        
        let n = sender.tag
        
        let alert=UIAlertController(title: "Delete", message: "Are you sure want to delete?", preferredStyle: .alert)
        let ok=UIAlertAction(title: "Cancel", style:.cancel,handler: nil)
        let more=UIAlertAction(title: "Delete", style: .destructive, handler:{ACTION in
            
            let dml=DMLOperation()
            self.allData=dml.datadelete(index: n)
            self.tblShowData.reloadData()
            
        })
        alert.addAction(ok)
        alert.addAction(more)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}

extension ShowDataVC:UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        let searchText=searchController.searchBar.text

        if searchText==""
        {
            allData=dml.showdata()
        }
        else
        {
            allData=allData.filter{
                (($0.name?.contains(searchText!))!)
            }
        }
        self.tblShowData.reloadData()
    }
    
    
}
