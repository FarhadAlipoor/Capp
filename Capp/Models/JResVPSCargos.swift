//
//  JResVPSCargos.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/21/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow
struct JResVPSCargos: ArrowParsable {
    
    var cargos = [JVPSCargo]()
    
    mutating func deserialize(_ json: JSON) {
        cargos <-- json
    }
}

