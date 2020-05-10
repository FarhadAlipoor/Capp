//
//  JTrailerType.swift
//  Capp
//
//  Created by tannaz on 12/31/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JTrailer: ArrowParsable {
    
    var id                          = Int()
    var name                        = String()
    var isActive                    = Bool()
    
    init() {}
    
    mutating func deserialize(_ json: JSON) {
        
        id                             <-- json["ID"]
        name                           <-- json["Name"]
        isActive                       <-- json["IsActive"]
       
        
    }
    
    init?(warehouse: Warehouseable) {
        self.id = warehouse.get("ID") ?? 0
        self.name = warehouse.get("Name") ?? ""
        self.isActive = warehouse.get("IsActive") ?? false
    }
    
    static func parseRes(_ dictionary: Any?) -> JTrailer {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JTrailer()
            one.deserialize(json)
            return one
        }
        return JTrailer()
    }
}
