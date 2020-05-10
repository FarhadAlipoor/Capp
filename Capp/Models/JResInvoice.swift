//
//  JResInvoice.swift
//  Capp
//
//  Created by tannaz on 2/16/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow
struct JResInvoice: ArrowParsable {
    
    var invoices = [JInvoice]()
    
    mutating func deserialize(_ json: JSON) {
        invoices <-- json
    }
}
