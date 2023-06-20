//
//  FAQCellVC.swift
//  Assessment-2
//
//  Created by MAC on 15/06/23.
//

import UIKit

class FAQCellVC: UITableViewCell {
    
    @IBOutlet weak var imgQuestion: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
