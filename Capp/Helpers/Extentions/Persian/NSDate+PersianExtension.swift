//
//  NSDate+PersianExtension.swift
//  Persian Extensions
//
//  Created by Sina Khalili on 5/13/16.
//  Copyright © 2016 Sina Khalili. All rights reserved.
//

import Foundation

extension Date {
    
    /**
     Converts the NSDate to Persian Date Format
     
     - returns: Persian date, like : خروجی: ۱۶ فروردین ۱۳۷۵
     */
    func persianDate() -> String {
        let calendar    = Foundation.Calendar.current
        let components  = (calendar as NSCalendar).components([.day , .month , .year], from: self)
        let jalaali     = JDF().toJalaali(components.year!, gm: components.month!, gd: components.day!)
        return "\(jalaali.day) \(JDF.monthName[jalaali.month-1]) \(jalaali.year)".persianDigits()
    }
    
    /**
     Converts the NSDate's time to Persian Time Format
     
     - returns: Persian time (hour:minute)
     */
    func persianTime() -> String {
        let calendar    = Foundation.Calendar.current
        let components  = (calendar as NSCalendar).components([.hour, .minute], from: self)
        return "\(components.hour!.persianDigits()):\(components.minute!.persianDigits())"
        
    }
    
    /**
     If it's today returns the time ago
     Else returns persian date
     
     - returns: Date to show, like:
     
     خروجی برای امروز: ۲ ساعت قبل    و    خروجی برای روز های قبل: ۱۶ فروردین ۱۳۷۵
     
     */
    func smartDate() -> String {
        if isInSameDayAs(date: Date()) {
            return timeAgo()
        } else {
            return persianDate()
        }
    }
    
    /**
     Converts to the jalaali date time and format it in Persian
     
     - returns: Something like : دوشنبه ۱ اسفند ۱۳۹۴ . ۲۳:۲۳
     */
    func persianDateTime() -> String {
        //return "\(dayOfWeekInPersian()) \(persianDate()) . \(persianTime())"
        return "\(persianDate()) . \(persianTime())"
    }
    
    /**
     Calculates number of the week day ( 1 to 7 )
     
     - returns: Number of weekday
     */
    func dayOfWeek()->Int {
        let myCalendar = Foundation.NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let myComponents = (myCalendar as NSCalendar).components(.weekday, from: self)
        let weekDay = myComponents.weekday!
        return weekDay
    }
    
    /**
     Calculates number of the week day ( 1 to 7 ) in jalaali
     
     - returns: Number of weekday in jalaali
     */
    func dayOfWeekInJalaali()->Int {
        let d = dayOfWeek()
        return d < 7 ? d + 1 : 1
    }
    
    /**
     Return the day of the week in persian
     
     - returns: something like "شنبه"
     */
    func dayOfWeekInPersian()->String {
        let days = ["یکشنبه", "دوشنبه", "سه شنبه", "چهارشنبه", "پنجشنبه", "جمعه", "شنبه"]
        let d = dayOfWeek()
        if d < 8 {
            return days[d-1]
        } else {
            return ""
        }
    }
    
    
    // shows 1 or two letter abbreviation for units.
    // does not include 'ago' text ... just {value}{unit-abbreviation}
    // does not include interim summary options such as 'Just now'
    func timeAgoSimple() -> String {
        let components = self.dateComponents()
        
        if components.year! > 0 {
            return stringFromFormat("%%d%@yr", withValue: components.year!)
        }
        
        if components.month! > 0 {
            return stringFromFormat("%%d%@mo", withValue: components.month!)
        }
        
        // TODO: localize for other calanders
        if components.day! >= 7 {
            let value = components.day!/7
            return stringFromFormat("%%d%@w", withValue: value)
        }
        
        if components.day! > 0 {
            return stringFromFormat("%%d%@d", withValue: components.day!)
        }
        
        if components.hour! > 0 {
            return stringFromFormat("%%d%@h", withValue: components.hour!)
        }
        
        if components.minute! > 0 {
            return stringFromFormat("%%d%@m", withValue: components.minute!)
        }
        
        if components.second! > 0 {
            return stringFromFormat("%%d%@s", withValue: components.second! )
        }
        
        return ""
    }
    
    /**
     Calculates the diferrence between now and NSDate
     
     - returns: something like "۴ ساعت قبل"
     */
    func timeAgo() -> String {
        let components = self.dateComponents()
        
        if components.year! > 0 {
            if components.year! < 2 {
                return "سال قبل"
            } else {
                return stringFromFormat("%@ سال قبل", withValue: components.year!)
            }
        }
        
        if components.month! > 0 {
            if components.month! < 2 {
                return "ماه قبل"
            } else {
                return stringFromFormat("%@ ماه قبل", withValue: components.month!)
            }
        }
        
        // TODO: localize for other calanders
        if components.day! >= 7 {
            let week = components.day!/7
            if week < 2 {
                return "هفته ی قبل"
            } else {
                return stringFromFormat("%@ هفته قبل", withValue: week)
            }
        }
        
        if components.day! > 0 {
            if components.day! < 2 {
                return "دیروز"
            } else  {
                return stringFromFormat("%@ روز قبل", withValue: components.day!)
            }
        }
        
        if components.hour! > 0 {
            if components.hour! < 2 {
                return "یک ساعت قبل"
            } else  {
                return stringFromFormat("%@ ساعت قبل", withValue: components.hour!)
            }
        }
        
        if components.minute! > 0 {
            if components.minute! < 2 {
                return "یک دقیقه قبل"
            } else {
                return stringFromFormat("%@ دقیقه قبل", withValue: components.minute!)
            }
        }
        
        if components.second! > 0 {
            if components.second! < 5 {
                return "الآن"
            } else {
                return stringFromFormat("%@ ثانیه قبل", withValue: components.second!)
            }
        }
        
        return ""
    }
    
    /**
     Is this the same day as passed NSDate
     
     - parameter date: A NSDate
     
     - returns: If they are the same day or not
     */
    func isInSameDayAs(date: Date) -> Bool {
        return Calendar.gregorian.isDate(self, inSameDayAs: date)
    }
    
    /**
     Is this NSDate today or not?
     
     - returns: If it is today or not
     */
    func isToday() -> Bool {
        return isInSameDayAs(date: Date())
    }
    
    
    struct Calendar {
        static let gregorian = Foundation.NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
    }
    
    fileprivate func dateComponents() -> DateComponents {
        let calander = Foundation.Calendar.current
        return (calander as NSCalendar).components([.second, .minute, .hour, .day, .month, .year], from: self, to: Date(), options: [])
    }
    
    fileprivate func stringFromFormat(_ format: String, withValue value: Int) -> String {
        let localeFormat = String(format: format, Int(value).persianDigits())
        return String(format: localeFormat, value)
    }
    
}
