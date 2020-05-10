//
//  JDriver.swift
//  Capp
//
//  Created by tannaz on 11/29/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JResDriver: ArrowParsable , Storable {

    var licenceNo                   = Int()
    var firstName                   = String()
    var lastName                    = String()
    var nationalCode                = String()
    var cardNo                      = Int()
    var docNo                       = Int()
    var isActiveOrg                 = Bool()
    var phoneNom                    = Int()
    var driverNom                   = Int()
    var mobileNom                   = Int()
    
    init() {}

    mutating func deserialize(_ json: JSON) {
        
        licenceNo                       <-- json["LicenceNo"]
        firstName                       <-- json["FirstName"]
        lastName                        <-- json["LastName"]
        nationalCode                    <-- json["NationalCode"]
        cardNo                          <-- json["CardNo"]
        docNo                           <-- json["DocNumber"]
        isActiveOrg                     <-- json["IsActiveOrg"]
        phoneNom                        <-- json["PhoneNo"]
        driverNom                       <-- json["DriverNom"]

    }
    
    init?(warehouse: Warehouseable) {
        self.licenceNo = warehouse.get("LicenceNo") ?? 0
        self.firstName = warehouse.get("firstName") ?? ""
        self.lastName = warehouse.get("lastName") ?? ""
        self.nationalCode = warehouse.get("nationalCode") ?? ""
        self.cardNo = warehouse.get("cardNo") ?? 0
        self.isActiveOrg = warehouse.get("isActiveOrg") ?? false
    }
    
    static func parseRes(_ dictionary: Any?) -> JResDriver {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JResDriver()
            one.deserialize(json)
            return one
        }
        return JResDriver()
    }
}

enum JUserSaveAfter: Int {
    case update     = 0
    case register   = 1
    case login      = 2
    case edit       = 3
    case logout     = 4
    case reopen     = 5
}
