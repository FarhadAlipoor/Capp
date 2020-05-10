//
//  JTrailerType.swift
//  Capp
//
//  Created by tannaz on 12/24/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import Foundation
import Arrow

struct JTrailerType: ArrowParsable {
    
    var name                        = String()
    var code                        = Int()
    var id                          = Int()
    var maxWeight                   = Int()
    var minWeight                   = Int()
    
    init() {}
    
    mutating func deserialize(_ json: JSON) {
        
        id                              <-- json["id"]
        name                           <-- json["name"]
        code                           <-- json["code"]
        maxWeight                        <-- json["maxWeight"]
        minWeight                       <-- json["minWeight"]
        
    }
    
    init?(warehouse: Warehouseable) {
        self.id = warehouse.get("id") ?? 0
        self.name = warehouse.get("name") ?? ""
        self.code = warehouse.get("code") ?? 0
        self.maxWeight = warehouse.get("maxWeight") ?? 0
        self.minWeight = warehouse.get("minWeight") ?? 0
    }
    
    static func parseRes(_ dictionary: Any?) -> JTrailerType {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JTrailerType()
            one.deserialize(json)
            return one
        }
        return JTrailerType()
    }
}
