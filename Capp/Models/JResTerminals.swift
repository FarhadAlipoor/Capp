//
//  JResTerminals.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

// response of `user addresses list` api
struct JResTerminals: ArrowParsable {
    var terminals = [JTerminalResponse]()
    
    mutating func deserialize(_ json: JSON) {
        terminals <-- json
    }
}

