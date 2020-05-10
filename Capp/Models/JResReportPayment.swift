//
//  JResReportPayment.swift
//  Capp
//
//  Created by Tannaz Parsa on 3/3/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JResReportPayment: ArrowParsable {
    
    var paymentsReports                 = [JReportPayment]()
    
    mutating func deserialize(_ json: JSON) {
        paymentsReports                       <-- json
    }
}
