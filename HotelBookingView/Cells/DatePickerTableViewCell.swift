//
//  DatePickerTableViewCell.swift
//  HotelBookingView
//
//  Created by Jetmir Morina on 3/17/17.
//  Copyright © 2017 Jetmir Morina. All rights reserved.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {

    @IBOutlet weak var datePicker: UIDatePicker!
    override func awakeFromNib() {
        super.awakeFromNib()
        costumizeView()
    }

   
    
    func costumizeView(){
        datePicker.backgroundColor = kMAIN_BG_COLOR
        datePicker.tintColor = UIColor.white
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.datePickerMode = UIDatePickerMode.date
    }
}
