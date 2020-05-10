//
//  JResPackageType.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JResPackageType: ArrowParsable {
    
    var id              = Int()
    var packageName     = String()
    var icon            = String()

    
    mutating func deserialize(_ json: JSON) {
        id                     <-- json["PackageTypeID"]
        packageName            <-- json["PackageTypeName"]
        icon                   <-- json["Icon"]

    }
}
