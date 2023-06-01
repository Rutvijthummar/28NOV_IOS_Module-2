//
//  ViewController.swift
//  M5ASS8
//
//  Created by MAC on 11/05/23.
//  Make an app to show different -different style type of cell
//  according say suppose filpkart front page design.

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myTable: UITableView!
    
    var MobImagesAndNames : [(String, String)] = [("1", "OnePlus 10r"),("11",""), ("2", "Oppo A17 K"),("22",""), ("3","Vivo T1"), ("33",""), ("44","Vivo Y Series"), ("44",""), ("5","Galaxy Z Fold"), ("55",""), ("6","One Plus CE 2"),("66",""), ("7","One Plus"),("77","")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTable.register(UINib(nibName: FlipkartCell.id, bundle: nil), forCellReuseIdentifier: FlipkartCell.id)
        
        myTable.register(UINib(nibName: DifferentCellFlipkart.id, bundle: nil), forCellReuseIdentifier: DifferentCellFlipkart.id)
        
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MobImagesAndNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.row % 2 == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: FlipkartCell.id, for: indexPath) as? FlipkartCell
                cell?.imgView.image = UIImage(named: MobImagesAndNames[indexPath.row].0)
                cell?.lblText.text = MobImagesAndNames[indexPath.row].1
                
                
                cell?.imgView.contentMode = .scaleAspectFill
                return cell ?? UITableViewCell()
        } else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: DifferentCellFlipkart.id, for: indexPath) as? DifferentCellFlipkart
            cell2?.myImgView.image = UIImage(named: MobImagesAndNames[indexPath.row].0)
            cell2?.myImgView.contentMode = .scaleAspectFill
                return cell2 ?? UITableViewCell()
        }
    
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 70.00
        } else {
            return 150.00
        }
    
        }
    
    
}


