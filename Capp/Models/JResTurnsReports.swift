//
//  JResTurnsReports.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit
import Arrow

struct JResTurnsReports: ArrowParsable {
    var turnsReports = [JReportTurn]()
    
    mutating func deserialize(_ json: JSON) {
        turnsReports <-- json
    }
}
