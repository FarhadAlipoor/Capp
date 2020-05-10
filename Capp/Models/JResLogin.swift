//
//  JResLogin.swift
//  Capp
//
//  Created by tannaz on 2/26/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JResLogin: ArrowParsable {
    
    var vehicleSubmit                   = Bool()

    mutating func deserialize(_ json: JSON) {
        vehicleSubmit                       <-- json["VehicleSubmit"]
    }
}
