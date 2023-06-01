//
//  TableViewCell.swift
//  M5ASS4
//
//  Created by MAC on 30/05/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var imgData: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
