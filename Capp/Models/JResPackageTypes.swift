//
//  JResPackageTypes.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit
import Arrow

// response of `user addresses list` api
struct JResPackageTypes: ArrowParsable {
    var packagesType = [JResPackageType]()
    
    mutating func deserialize(_ json: JSON) {
        packagesType <-- json
    }
}
