
//
//  CountryCell.swift
//  ASS1
//
//  Created by MAC on 01/06/23.
//

import UIKit

class CountryCell: UITableViewCell {
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRegion: UILabel!
    @IBOutlet weak var lblLati: UILabel!
    @IBOutlet weak var lblLogi: UILabel!
    @IBOutlet weak var imgFlag: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
