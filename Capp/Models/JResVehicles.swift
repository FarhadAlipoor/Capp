//
//  JResVehicles.swift
//  Capp
//
//  Created by tannaz on 12/26/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit
import Arrow

// response of `user addresses list` api
struct JResVehicles: ArrowParsable {
    var vehicles = [JVehicle]()
    
    mutating func deserialize(_ json: JSON) {
        vehicles <-- json // it's array of array string
    }
}
