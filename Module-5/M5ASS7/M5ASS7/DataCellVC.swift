//
//  DataCellVC.swift
//  M5ASS7
//
//  Created by MAC on 21/03/23.
//

import UIKit

class DataCellVC: UITableViewCell {
    
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblSubject: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblMobileNumber: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblFullName.textColor = .black
        self.lblSubject.textColor = .red
        self.lblCity.textColor = .brown
        self.lblEmail.textColor = .blue
        self.lblMobileNumber.textColor = .green
        
        DispatchQueue.main.async {
            
            self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.height / 2
            
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
