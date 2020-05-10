//
//  JPaymentToken.swift
//  Capp
//
//  Created by tannaz on 2/14/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JPaymentToken: ArrowParsable {
    
    var pecToken                    = String()
    var orderID                     = Int()
    var pecExpireDateTime           = String()
    
    init() {}
    
    mutating func deserialize(_ json: JSON) {
        
        pecToken                     <-- json["PecToken"]
        orderID                      <-- json["OrderID"]
        pecExpireDateTime            <-- json["PecExpireDateTime"]
        
    }
    
    init?(warehouse: Warehouseable) {
        self.pecToken = warehouse.get("PecToken") ?? ""
        self.orderID = warehouse.get("OrderID") ?? 0
        self.pecExpireDateTime = warehouse.get("PecExpireDateTime") ?? ""
    }
    
    static func parseRes(_ dictionary: Any?) -> JPaymentToken {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JPaymentToken()
            one.deserialize(json)
            return one
        }
        return JPaymentToken()
    }
}


