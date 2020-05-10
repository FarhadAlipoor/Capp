//
//  Int+PersianExtension.swift
//  Persian Extensions
//
//  Created by Sina Khalili on 5/13/16.
//  Copyright © 2016 Sina Khalili. All rights reserved.
//

import Foundation

extension Int {
    
    /**
     Converts the int digits to persian characters
     
     - returns: String of number with persian characters
     */
    func persianDigits() -> String {
        let number = NSNumber(value: self as Int)
        let formatter = NumberFormatter()
        let locale = Locale(identifier: "fa")
        formatter.locale = locale
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: number)!
    }
    
    /**
     Converts the integer to h,m,s format to show (+persian digits)
     
     - returns: String in h,m,s format to show
     */
    func persianTimeDigits() -> String {
        if self >= 10 {
            return persianDigits()
        } else {
            return "۰\(persianDigits())"
        }
    }
    
    func tomans() -> String {
        return "‏\(self.persianDigits()) \("Tomans".text)"
    }
    
    func day() -> String {
        return "\(self.persianDigits()) \("Day".text)"
    }
    
    func hours() -> String {
        return "\(self.persianDigits()) \("Hours".text)"
    }
    
    func tomaans() -> String {
        return "‏\(self.persianDigits()) \("Tomaans".text)"
    }
    
    func rial() -> String {
        return "‏\(self.persianDigits()) \("Rial".text)"
    }
    
    func comments() -> String {
        return "\(self.persianDigits()) \("Comment".text)"
    }
    
}
