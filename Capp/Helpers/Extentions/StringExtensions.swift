//
//  StringExtensions.swift
//  Chilivery
//
//  Created by Sina Khalili on 9/25/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import UIKit
import CoreGraphics
import CoreLocation

extension String {
    
    var text: String {
        get {
            return NSLocalizedString(self, comment: "")
        }
    }
    
    subscript (i: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    func toDateFrom_yyyy_MM_dd() -> Date? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: self)
    }
    
    func toDictionaryAsAnyObject() -> Any? {
        if let data = data(using: String.Encoding.utf8, allowLossyConversion: false) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: [])
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func toDictionary() -> NSDictionary {
        let itemsData = data(using: String.Encoding.utf8)
        do {
            let responseObject = try JSONSerialization.jsonObject(with: itemsData!, options: []) as! [String:AnyObject]
            return responseObject as NSDictionary
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
        return NSDictionary()
    }
    
    func withIcon(_ uncide:     String,
                  size:         CGFloat             = 14,
                  iconSize:     CGFloat?            = 12,
                  color:        UIColor             = UIColor.white,
                  iconColor:    UIColor?            = nil,
                  underline:    Bool                = false,
                  offset:       Int                 = 0,
                  iconOffset:   Int                 = -1,
                  middleSpace:  Bool                = true,
                  forceAlignment: NSTextAlignment?  = nil) -> NSAttributedString {
        
        let start = forceAlignment != nil ? 1 : 0
        var str = "‏\(uncide)\(middleSpace ? " " : "")\(self)"
        str = String(str.dropFirst()) // TODO:: WTH!
        switch forceAlignment {
        case .left?:
            str = "\u{202A}".appending(str)
            break
        case .right?:
            str = "\u{202F}".appending(str)
            break
        default:
            break
        }
        let attrString = NSMutableAttributedString(string: str, attributes: [
            NSAttributedStringKey.font: Fonts.font(withSize: size),
            NSAttributedStringKey.foregroundColor: color,
            NSAttributedStringKey.baselineOffset: offset
            ])
        attrString.addAttribute(NSAttributedStringKey.font,
                                value: Fonts.capp(withSize: iconSize != nil ? iconSize! : size),
                                range: NSMakeRange(start, 2))
        attrString.addAttribute(NSAttributedStringKey.baselineOffset, value: iconOffset, range: NSMakeRange(start, 2))
        if let iconColor = iconColor {
            attrString.addAttribute(NSAttributedStringKey.foregroundColor,
                                    value: iconColor,
                                    range: NSMakeRange(start, 2))
        }
        if underline {
            attrString.addAttribute(NSAttributedStringKey.underlineStyle , value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(1 + start, str.characters.count - 3))
        }
        return attrString
    }
    
    // colorize dots!
    func dottedAttributedString(
                  size:         CGFloat             = 14,
                  dotSize:      CGFloat?            = nil,
                  color:        UIColor             = UIColor.black,
                  dotColor:     UIColor?            = nil,
                  offset:       Int                 = 0,
                  dotOffset:   Int                 = -1,
                  middleSpace:  Bool                = true,
                  forceAlignment: NSTextAlignment?  = nil) -> NSAttributedString {

        var str = self
        switch forceAlignment {
        case .left?:
            str = "\u{202A}".appending(str)
            break
        case .right?:
            str = "\u{202F}".appending(str)
            break
        default:
            break
        }
        let attrString = NSMutableAttributedString(string: str, attributes: [
            NSAttributedStringKey.font: Fonts.font(withSize: size),
            NSAttributedStringKey.foregroundColor: color,
            NSAttributedStringKey.baselineOffset: offset
            ])
        for i in 0..<str.count {
            if str[i] == "." {
                attrString.addAttributes([
                    NSAttributedStringKey.font: Fonts.bold(withSize: dotSize != nil ? dotSize! : size),
                    NSAttributedStringKey.foregroundColor: (dotColor != nil ? dotColor! : CappColors.darkBlue),
                    NSAttributedStringKey.baselineOffset: dotOffset,
                    ], range: NSMakeRange(i, 1))
            }
        }
        return attrString
    }
    
    func toInt() -> Int {
        
        return (self as NSString).integerValue

    }
    
    func isValidEmail() -> Bool {
        return checkRegex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
    }
    func isValidDriverCard() -> Bool {
        return checkRegex("^\\d{7}$")
    }
    
    func isValidMobileNumber() -> Bool {
        return checkRegex("^\\d{11}$")
    }
    func isNumeric() -> Bool {
        return checkRegex("^[0-9]+$")
    }
    
    func checkRegex(_ regex: String) -> Bool {
        let regexTest = NSPredicate(format:"SELF MATCHES %@", regex)
        return regexTest.evaluate(with: self)
    }
    
    func parseToCoordinate() -> CLLocationCoordinate2D {
        var str = self
        str = str.replacingOccurrences(of: "POINT(", with: "")
        str = str.replacingOccurrences(of: ")", with: "")
        let arrPoint = str.components(separatedBy: " ")
        if arrPoint.count > 1 {
            return CLLocationCoordinate2D(latitude: Double(arrPoint[0]) ?? 0, longitude: Double(arrPoint[1]) ?? 0)
        }
        return CLLocationCoordinate2D()
    }
    
    func subString(startIndex: Int, endIndex: Int) -> String {
        let end = (endIndex - self.count) + 1
        let indexStartOfText = self.index(self.startIndex, offsetBy: startIndex)
        let indexEndOfText = self.index(self.endIndex, offsetBy: end)
        let substring = self[indexStartOfText..<indexEndOfText]
        return String(substring)
    }
    
    func toFloat() -> Float {
        
            return (self as NSString).floatValue
    
    }
    
    
}
