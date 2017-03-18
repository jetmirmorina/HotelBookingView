//
//  Date+Extension.swift
//  HotelBookingView
//
//  Created by Jetmir Morina on 3/18/17.
//  Copyright © 2017 Jetmir Morina. All rights reserved.
//

import UIKit

extension Date {

    func dateByAddingNumberOfDays( numberOfDays : Int ) -> Date? {
        let dayComponenet = NSDateComponents()
        dayComponenet.day = numberOfDays
        let theCalendar = NSCalendar.current
        let nextdate = theCalendar.date(byAdding: dayComponenet as DateComponents, to: self)
       // var nextDate = theCalendar.dateByAddingComponents(dayComponenet, toDate:self, options: nil)
        
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
    
//    func numberDaysBetweenDate (endDate : Date) -> Int {
//        
//        var retVal : Int  = 0
//        let cal = NSCalendar.current
//        let unit:NSCalendar.Unit = .day
//        let components = cal.components(unit, fromDate: self, toDate: cal.startOfDay(for: endDate), options: nil)
//        
//        let components = cal.components(unit, fromDate: self, toDate: endDate, options: [])
//
//        
//        
//        
//        cal.com
//        
//        retVal = components.day
//        return abs(retVal);
//    }
    
    func daysBetweenDate(toDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: self, to: toDate)
        return components.day ?? 0
    }

}
