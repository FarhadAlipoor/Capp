//
//  JResPackages.swift
//  Capp
//
//  Created by tannaz on 2/18/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow
struct JResPackages: ArrowParsable {
    
    var packages        = [JPayPackage]()

    mutating func deserialize(_ json: JSON) {
        packages      <-- json
    }
}
