//
//  RTOVC.swift
//  Assessment-2
//
//  Created by MAC on 14/06/23.
//

import Foundation
import UIKit

class RTOVC: UIViewController {
    
    @IBOutlet weak var colRTO: UICollectionView!
    
    var name = ["Learn", "Practice", "Moke Test", "Revision", "RTO Office", "Process", "Statistics", "Forms", "FAQ"]
    
    var image = ["Learn", "Practice", "Make Test", "Revision", "RTO", "Process", "Statistics", "Forms", "FAQ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.colRTO.delegate = self
        self.colRTO.dataSource = self
        
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

extension RTOVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RTOCellVC", for: indexPath) as! RTOCellVC
        cell.lblCell.text = name[indexPath.row]
        cell.imgCell.image = UIImage(named: image[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
         UICollectionViewLayout, sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        return CGSize(width: (view.frame.size.width/3)-3,
                      height: (view.frame.size.width/3)-3)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 3, bottom: 5, right: 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let vc = storyboard?.instantiateViewController(identifier: "LearnVC") as! LearnVC
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        else if indexPath.row == 1 {
            
            let vc = storyboard?.instantiateViewController(identifier: "PraticeVC") as! PraticeVC
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        else if indexPath.row == 2 {
            
            let vc = storyboard?.instantiateViewController(identifier: "MokeTestVC") as! MokeTestVC
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        else if indexPath.row == 3 {
            
            let vc = storyboard?.instantiateViewController(identifier: "MarkedVC") as! MarkedVC
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        else if indexPath.row == 4 {
            
            let vc = storyboard?.instantiateViewController(identifier: "RTOOfficeVC") as! RTOOfficeVC
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        else if indexPath.row == 5 {
            
            let vc = storyboard?.instantiateViewController(identifier: "DrivingVC") as! DrivingVC
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        else if indexPath.row == 6 {
            
            let vc = storyboard?.instantiateViewController(identifier: "StatisticsVC") as! StatisticsVC
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        else if indexPath.row == 7 {
            
            let vc = storyboard?.instantiateViewController(identifier: "FormsVC") as! FormsVC
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        else if indexPath.row == 8 {
            
            let vc = storyboard?.instantiateViewController(identifier: "FAQVC") as! FAQVC
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        else {
            print("Error")
        }
        
    }
    
    
}
