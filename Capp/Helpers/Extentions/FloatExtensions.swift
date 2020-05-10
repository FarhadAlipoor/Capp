//
//  FloatExtensions.swift
//  Chilivery
//
//  Created by Sina Khalili on 11/13/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import Foundation
import UIKit
extension Float {

    var color: UIColor {
        get {
            switch Int(self) {
            case 1:
                return CappColors.red
            case 2:
                return CappColors.darkBlue
            case 3:
                return CappColors.green_light
            case 4:
                return CappColors.green
            default:
                return CappColors.green
            }
        }
    }

}
