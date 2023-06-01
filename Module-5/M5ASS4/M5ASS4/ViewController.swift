//
//  ViewController.swift
//  M5ASS4
//
//  Created by MAC on 30/05/23.
//  Make an app display image in cell.

import UIKit

class ViewController: UIViewController  {
    
    
    @IBOutlet weak var tblImage: UITableView!
    
    var Image = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tblImage.delegate = self
        self.tblImage.dataSource = self
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Image.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.imgData.image = UIImage(named: Image[indexPath.row])
        return cell
    }
    
    
}

