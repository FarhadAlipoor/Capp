//
//  JResSaloonCargo.swift
//  Capp
//
//  Created by tannaz on 2/8/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow
struct JResSaloonCargo: ArrowParsable {
    
    var saloonName       = String()
    var startDate       = String()
    var balance         = Int()
    var count           = Int()
    var salonCargo      = [JVPSCargo]()
    
    mutating func deserialize(_ json: JSON) {
        saloonName           <-- json["SaloonName"]
        startDate            <-- json["StartDate"]
        balance              <-- json["Etebar"]
        count                <-- json["Count"]
        salonCargo           <-- json["SaloonCargo"]
    }
}





