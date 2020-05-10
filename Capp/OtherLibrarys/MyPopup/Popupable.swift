//
//  Popupable.swift
//  Chilivery
//
//  Created by Sina Khalili on 10/24/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import Foundation
import UIKit
protocol Popupable {
    
    // max and min height we can have as popup (including it's navBar and tabBar height)
    func minHeight() -> CGFloat
    func maxHeight() -> CGFloat
    func childHeight() -> CGFloat
    func outsideTapped()
}

extension Popupable {
    
    // if shown in popup vc
    var parentPopup: MyPopupVC? {
        get {
        if let parentVC = (self as? UIViewController)?.parent as? MyPopupVC {
            return parentVC
        } else if let parentVC = (self as? UIViewController)?.parent?.parent as? MyPopupVC {
            return parentVC
        }
        return nil
        }
    }
    
    // this parameter is helpful in popup views to have dynamic heights; in fact, it tells parent to set a height for popup child, if possible
    var preferredHeight: CGFloat {
        get {
            return parentPopup?.childsPreferredHeight ?? childHeight()
        }
    }
    func setPreferredHeight(_ newValue: CGFloat) {
        parentPopup?.childsPreferredHeight = newValue
    }
    
    // content height is to set and get preffered height without tabBar or navBar
    var contentHeight: CGFloat {
        get {
            let navHeight: CGFloat = ((self as? UIViewController)?.navigationController?.navigationBar.frame.height ?? CGFloat())
            let tabHeight: CGFloat = ((self as? UIViewController)?.tabBarController?.tabBar.frame.height ?? CGFloat())
            return preferredHeight - navHeight - tabHeight
        }
    }
    func setContentHeight(_ newValue: CGFloat) {
        let navHeight: CGFloat = ((self as? UIViewController)?.navigationController?.navigationBar.frame.height ?? CGFloat())
        let tabHeight: CGFloat = ((self as? UIViewController)?.tabBarController?.tabBar.frame.height ?? CGFloat())
        setPreferredHeight(min(childHeight(), newValue) + navHeight + tabHeight)
    }
    
    func minHeight() -> CGFloat {
        return 200
    }
    
    func outsideTapped() {
        parentPopup?.dismiss(animated: true, completion: nil)
    }
}

