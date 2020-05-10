//
//  JPermitVPSResponse.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/21/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JPermitVPSResponse: ArrowParsable {
    
    var permitNo                        = Int()
    var expire                          = Int()
    var company                         = String()
    var dateTime                        = String()
    var endDateTime                     = String()
    var cargo                           = String()
    init() {}
    
    mutating func deserialize(_ json: JSON) {
        permitNo                             <-- json["PermitNo"]
        expire                              <-- json["Expire"]
        company                             <-- json["Company"]
        dateTime                            <-- json["DateTime"]
        endDateTime                         <-- json["EndDateTime"]
        cargo                               <-- json["Cargo"]
    }
    
    init?(warehouse: Warehouseable) {
        self.permitNo = warehouse.get("PermitNo") ?? 0
        self.expire = warehouse.get("Expire") ?? 0
        self.company = warehouse.get("Company") ?? ""
        self.dateTime = warehouse.get("DateTime") ?? ""
        self.endDateTime = warehouse.get("EndDateTime") ?? ""
        self.cargo = warehouse.get("Cargo") ?? ""
    }
    
    static func parseRes(_ dictionary: Any?) -> JPermitVPSResponse {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JPermitVPSResponse()
            one.deserialize(json)
            return one
        }
        return JPermitVPSResponse()
    }
    
}
