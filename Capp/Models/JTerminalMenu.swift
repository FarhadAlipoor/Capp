//
//  JTerminalMenu.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JTerminalMenu: ArrowParsable {
    
    var id                          = Int()
    var name                        = String()
    var icon                        = String()
    
    init() {}
    
    mutating func deserialize(_ json: JSON) {
        
        id                             <-- json["ID"]
        name                           <-- json["Name"]
        icon                           <-- json["Icon"]
        
        
    }
    
    init?(warehouse: Warehouseable) {
        self.id = warehouse.get("ID") ?? 0
        self.name = warehouse.get("Name") ?? ""
        self.icon = warehouse.get("Icon") ?? ""
    }
    
    static func parseRes(_ dictionary: Any?) -> JTerminalMenu {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JTerminalMenu()
            one.deserialize(json)
            return one
        }
        return JTerminalMenu()
    }
}
