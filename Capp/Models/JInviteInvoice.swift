//
//  JInviteInvoice.swift
//  Capp
//
//  Created by tannaz on 2/14/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JInviteInvoice: ArrowParsable {
    
    var invitePercent                   = Int()
    var inviteCount                     = Int()
    var inviteDiscountAmount            = Int()

    init() {}
    
    mutating func deserialize(_ json: JSON) {
        
        invitePercent                     <-- json["InvitePercent"]
        inviteCount                       <-- json["InviteCount"]
        inviteDiscountAmount              <-- json["InviteDiscountAmount"]
        
    }
    
    init?(warehouse: Warehouseable) {
        self.invitePercent = warehouse.get("InvitePercent") ?? 0
        self.inviteCount = warehouse.get("InviteCount") ?? 0
        self.inviteDiscountAmount = warehouse.get("InviteDiscountAmount") ?? 0
    }
    
    static func parseRes(_ dictionary: Any?) -> JInviteInvoice {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JInviteInvoice()
            one.deserialize(json)
            return one
        }
        return JInviteInvoice()
    }
}




