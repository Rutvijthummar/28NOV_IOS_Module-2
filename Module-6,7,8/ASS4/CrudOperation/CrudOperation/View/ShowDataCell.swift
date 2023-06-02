//
//  ShowDataCell.swift
//  CrudOperation
//
//  Created by MAC on 15/03/23.
//

import UIKit

class ShowDataCell: UITableViewCell {
    
    
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imgProfile.image = UIImage(named: "Profile")
        
        self.lblFullName.textColor = .blue
        self.lblCity.textColor = .green
        self.lblEmail.textColor = .red
        self.lblMobile.textColor = .brown
        
        DispatchQueue.main.async {
            
            self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.height / 2
            
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
