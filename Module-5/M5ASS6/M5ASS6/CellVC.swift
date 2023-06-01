//
//  CellVC.swift
//  M5ASS6
//
//  Created by MAC on 21/04/23.
//

import UIKit

class CellVC: UITableViewCell {
    
    
    @IBOutlet weak var lblDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
