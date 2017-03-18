//
//  HeaderTableViewCell.swift
//  HotelBookingView
//
//  Created by Jetmir Morina on 3/18/17.
//  Copyright © 2017 Jetmir Morina. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        costumizeView()
    }

    func costumizeView(){
        self.backgroundColor = kMAIN_BG_COLOR
    }
    
}
