//
//  RDriver.swift
//  Capp
//
//  Created by Tannaz Parsa on 12/20/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import RealmSwift

class RDriver: Object {
    
    @objc dynamic var mobileNumber:   Int = 0
    @objc dynamic var driverCardNo:  Int = 0
    
    var jDriver: JResDriver {
        get {
            var driver = JResDriver()
            driver.mobileNom = mobileNumber
            driver.driverNom = driverCardNo
            return driver
        }
    }
}
