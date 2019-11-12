//
//  UpcomingBookingCell.swift
//  TelemedPatient
//
//  Created by dr.mac on 18/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class UpcomingBookingCell: UITableViewCell {
    
   
    
    @IBOutlet weak var imgUser: UIImageViewX!
    
    
    @IBOutlet weak var lbeUserName: UILabel!
    
    @IBOutlet weak var lbeUserDes: UILabel!
    
  

    @IBOutlet weak var btnEst: UIButton!
    
    @IBOutlet weak var btnMedicalRec: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
