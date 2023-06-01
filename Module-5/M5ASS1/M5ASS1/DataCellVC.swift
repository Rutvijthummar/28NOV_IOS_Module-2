//
//  DataCellVC.swift
//  M5ASS1
//
//  Created by MAC on 23/02/23.
//  

import UIKit

class DataCellVC: UITableViewCell {
    
    
    @IBOutlet weak var lblData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.lblData.textColor = .blue
        self.lblData.font = UIFont.systemFont(ofSize: 20)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
