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
        costumizeView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    
    func costumizeView(){
        
        let selectedBgView = UIView()
        selectedBgView.backgroundColor = kSELECTED_CELL_BG_COLOR
        self.selectedBackgroundView = selectedBgView;
        
        self.backgroundColor = kMAIN_BG_COLOR
        leftLabel.textColor = UIColor.white.withAlphaComponent(0.5)
        rightLabel.textColor = .white
        
    }
    
}
