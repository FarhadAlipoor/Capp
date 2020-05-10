//
//  JCreditReport.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow
import UIKit

struct JCreditReport: ArrowParsable {
    
    
    var dsis    = Int()
    var vts     = Int()
    var capp    = Double()
    
    mutating func deserialize(_ json: JSON) {
        
        dsis                   <-- json["DSIS"]
        vts                    <-- json["VTS"]
        capp                   <-- json["CAPP"]
    }
}

