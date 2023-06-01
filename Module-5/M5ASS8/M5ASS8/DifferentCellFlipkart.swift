//
//  DifferentCellFlipkart.swift
//  M5ASS8
//
//  Created by MAC on 25/05/23.
//

import UIKit

class DifferentCellFlipkart: UITableViewCell {
    
    static let id = "DifferentCellFlipkart"
    
    
    @IBOutlet weak var myImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
