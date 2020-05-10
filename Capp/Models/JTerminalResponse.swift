//
//  JTerminalResponse.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JTerminalResponse: ArrowParsable , Storable {
    
    var id                          = Int()
    var name                        = String()
    var address                     = String()
    var latitude                    = Double()
    var longitude                   = Double()
    
    init() {}
    
    mutating func deserialize(_ json: JSON) {
        
        id                             <-- json["ID"]
        name                           <-- json["Name"]
        address                        <-- json["Address"]
        latitude                       <-- json["Latitude"]
        longitude                      <-- json["Longitude"]
    }
    
    init?(warehouse: Warehouseable) {
        self.id = warehouse.get("ID") ?? 0
        self.name = warehouse.get("Name") ?? ""
        self.address = warehouse.get("address") ?? ""
        self.latitude = warehouse.get("latitude") ?? 0
        self.longitude = warehouse.get("longitude") ?? 0
    }
    
    func toDictionary() -> [String : Any] {
        return [
            "id": id,
            "name": name
        ];
    }
    
    static func parseRes(_ dictionary: Any?) -> JTerminalResponse {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JTerminalResponse()
            one.deserialize(json)
            return one
        }
        return JTerminalResponse()
    }
}
