//
//  JResInvoice.swift
//  Capp
//
//  Created by tannaz on 2/14/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JInvoice: ArrowParsable {
    
    var invoiceID                   = Int()
    var tax                         = Int()
    var packageAmount               = Int()
    var discription                 = String()
    var payAmount                   = Int()
    var inviteInvoice               = [JInviteInvoice]()
    
    init() {}
    
    mutating func deserialize(_ json: JSON) {
        invoiceID                 <-- json["InvoiceID"]
        tax                       <-- json["Tax"]
        packageAmount             <-- json["PackageAmount"]
        discription               <-- json["Discription"]
        payAmount                 <-- json["PayAmount"]
        inviteInvoice             <-- json["InviteInvoiceResponse"]
        
    }
    
    init?(warehouse: Warehouseable) {
        self.invoiceID = warehouse.get("InvoiceID") ?? 0
        self.tax = warehouse.get("Tax") ?? 0
        self.packageAmount = warehouse.get("PackageAmount") ?? 0
        self.discription = warehouse.get("Discription") ?? ""
        self.payAmount = warehouse.get("PayAmount") ?? 0
        //self.inviteInvoice = warehouse.get("InviteInvoiceResponse") ?? []
    }
    
    static func parseRes(_ dictionary: Any?) -> JInvoice {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JInvoice()
            one.deserialize(json)
            return one
        }
        return JInvoice()
    }
}

   
