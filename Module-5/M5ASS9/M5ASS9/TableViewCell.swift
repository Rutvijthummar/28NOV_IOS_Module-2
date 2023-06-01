//
//  TableViewCell.swift
//  M5ASS9
//
//  Created by MAC on 24/05/23.
//  Make an app application to display collection view inside cell. 21
//Make an app to take one table view and set number of different styles of cell in which put collection view and scroll image in horizontal in multiple uitableviewcell.

import UIKit

class TableViewCell: UITableViewCell {
    
    var arrOfImageAndLabel : [(String,String)] = []
    @IBOutlet weak var lblOfTableView: UILabel!
    @IBOutlet weak var colView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.colView.delegate = self
        self.colView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOfImageAndLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colCell", for: indexPath) as? CollectionViewCell
        
        cell?.imgViewColView.layer.cornerRadius = 15
        cell?.imgViewColView.layer.backgroundColor = UIColor.black.cgColor
        cell?.imgViewColView.image = UIImage(named: arrOfImageAndLabel[indexPath.row].0)
       cell?.lblColView.text = arrOfImageAndLabel[indexPath.row].1
        return cell ?? UICollectionViewCell()
    }
    
    
}
