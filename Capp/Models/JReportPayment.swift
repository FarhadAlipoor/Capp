//
//  JReportPayment.swift
//  Capp
//
//  Created by Tannaz Parsa on 3/3/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow
struct JReportPayment: ArrowParsable {
    
    var dateTime                     = String()
    var isSuccess                    = Bool()
    var packageType                  = String()
    var package                      = String()
    var amount                       = Int()
    var terminal                     = String()
    
    mutating func deserialize(_ json: JSON) {
        dateTime                       <-- json["DateTime"]
        isSuccess                      <-- json["ISSuccess"]
        packageType                    <-- json["PackageType"]
        package                        <-- json["Package"]
        amount                         <-- json["Amount"]
        terminal                       <-- json["Terminal"]
    }
}
