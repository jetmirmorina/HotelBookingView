//
//  DescriptionsTableViewCell.swift
//  HotelBookingView
//
//  Created by Jetmir Morina on 3/17/17.
//  Copyright © 2017 Jetmir Morina. All rights reserved.
//

import UIKit

class DescriptionsTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
