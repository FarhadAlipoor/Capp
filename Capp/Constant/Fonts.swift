//
//  Fonts.swift
//  Capp
//
//  Created by tannaz on 11/19/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import UIKit

struct Fonts {
    
    static func font(withSize size: CGFloat) -> UIFont {
        
        return UIFont(name: "IRANYekanMobile(FaNum)", size: size)!
    }
    static func regular(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "IRANYekanMobileFaNum", size: size)!
    }
    static func light(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "IRANYekanMobileFaNum-Light", size: size)!
    }
    static func bold(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "IRANYekanMobileFaNum-Bold", size: size)!
    }
    static func capp(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "CAPP", size: size)!
    }
}

