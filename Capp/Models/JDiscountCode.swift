//
//  JDiscountCode.swift
//  Capp
//
//  Created by tannaz on 2/20/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JDiscountCode: ArrowParsable {
    var payAmount           = Int()
    var discountAmount      = Int()
    var tax                 = Int()

    
    mutating func deserialize(_ json: JSON) {
        payAmount           <-- json["PayAmount"]
        discountAmount      <-- json["DiscountAmount"]
        tax                 <-- json["TaxAmount"]
    }
}
