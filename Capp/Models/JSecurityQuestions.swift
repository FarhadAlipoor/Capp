//
//  JSecurityQuestions.swift
//  Capp
//
//  Created by tannaz on 12/4/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit
import Arrow

// response of `Security Questions list` api
struct JSecurityQuestions: ArrowParsable {
    var securityQuestions = [JResSecurityQuestion]()
    
    mutating func deserialize(_ json: JSON) {
        
        securityQuestions <-- json["securityQuestions"]
    }
}

