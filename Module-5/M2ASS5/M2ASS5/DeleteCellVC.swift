//
//  DeleteCellVC.swift
//  M2ASS5
//
//  Created by MAC on 27/02/23.
//

import UIKit



class DeleteCellVC: UITableViewCell {
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSubject: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnDelete: UIButton!
    
    
    
   
    
       override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
