//
//  ImagesViewCell.swift
//  DoctorsTelemed
//
//  Created by dr.mac on 02/11/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class ImagesViewCell: UITableViewCell {

    @IBOutlet weak var lbeTitle: UILabel!
    @IBOutlet weak var imgViews: UIImageViewX!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
