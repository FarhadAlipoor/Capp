//
//  Globals.swift
//  Chilivery
//
//  Created by Sina Khalili on 9/25/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import UIKit
import CoreLocation

class Globals {
    
    static var shared = Globals()
    
    var securityQuestions: [String] = []
    var terminals: [JTerminalResponse]  = [JTerminalResponse]()
    var selectedTerminal = JTerminalResponse()
    // handle popups' actions
//    var popups = [MWeak<UIViewController>]()
//    func addPopup(_ popupVC: UIViewController) {
//        popups.append(MWeak(popupVC))
//    }
//    func dismissPopups() {
//        for popup in popups {
//            popup.reference?.dismiss(animated: false, completion: nil)
//        }
//    }
    
}
var isDeveloper: Bool = false
