//
//  Extensions.swift
//  HotelBookingView
//
//  Created by Jetmir Morina on 3/18/17.
//  Copyright © 2017 Jetmir Morina. All rights reserved.
//

import UIKit


extension UIColor{
    class func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        let color = UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
        return color
    }
}

extension Date {
    
    func dateByAddingNumberOfDays( numberOfDays : Int ) -> Date? {
        let dayComponenet = NSDateComponents()
        dayComponenet.day = numberOfDays
        let theCalendar = NSCalendar.current
        let nextdate = theCalendar.date(byAdding: dayComponenet as DateComponents, to: self)
        return nextdate;
    }
    
    func nextDay() -> Date? {
        return dateByAddingNumberOfDays(numberOfDays: 1) as Date?;
    }
    
    func stringInFormat(format : String?) -> String {
        let dateFormatter =  DateFormatter()
        if let strFormat = format {
            dateFormatter.dateFormat = strFormat
        }
        return  dateFormatter.string(from: self);
    }
    
    func daysBetweenDate(toDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: self, to: toDate)
        return components.day ?? 0
    }
    
}
