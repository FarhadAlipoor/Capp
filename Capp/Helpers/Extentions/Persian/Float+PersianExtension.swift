//
//  Float+PersianExtension.swift
//  Chilivery
//
//  Created by Sina Khalili on 11/12/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import Foundation

public extension Float {
    
    /**
     Converts the int digits to persian characters
     
     - returns: String of number with persian characters
     */
    public func persianDigits() -> String {
        let number = NSNumber(value: self)
        let formatter = NumberFormatter()
        let locale = Locale(identifier: "fa")
        formatter.locale = locale
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: number)!.replacingOccurrences(of: ".", with: "/")
    }
    
}

