//
//  FlipkartCell.swift
//  M5ASS8
//
//  Created by MAC on 25/05/23.
//

import UIKit

class FlipkartCell: UITableViewCell {
    
    static let id = "FlipkartCell"

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
