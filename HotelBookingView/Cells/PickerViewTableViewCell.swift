//
//  PickerViewTableViewCell.swift
//  HotelBookingView
//
//  Created by Jetmir Morina on 3/17/17.
//  Copyright © 2017 Jetmir Morina. All rights reserved.
//

import UIKit

class PickerViewTableViewCell: UITableViewCell {

    @IBOutlet weak var pickerView: UIPickerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        costumizeView()
    }

    func costumizeView(){
        pickerView.backgroundColor = kMAIN_BG_COLOR
        pickerView.tintColor = UIColor.white
        pickerView.setValue(UIColor.white, forKeyPath: "textColor")
    }
    
}
