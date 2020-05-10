//
//  JVTSResponse.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/16/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JVTSResponse: ArrowParsable {
    
    var turnNom                         = Int()
    var terminalTurnID                  = Int()
    var terminalMessage                 = String()
    var dateTime                        = String()
    
    init() {}
    
    mutating func deserialize(_ json: JSON) {
        turnNom                             <-- json["TurnNo"]
        terminalTurnID                      <-- json["TerminalTurnID"]
        terminalMessage                     <-- json["TerminalMessage"]
        dateTime                            <-- json["DateTime"]
        
        
    }
    
    init?(warehouse: Warehouseable) {
        self.turnNom = warehouse.get("TurnNo") ?? 0
        self.terminalTurnID = warehouse.get("TerminalTurnID") ?? 0
        self.terminalMessage = warehouse.get("TerminalMessage") ?? ""
        self.dateTime = warehouse.get("DateTime") ?? ""
    }
    
    static func parseRes(_ dictionary: Any?) -> JVTSResponse {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JVTSResponse()
            one.deserialize(json)
            return one
        }
        return JVTSResponse()
    }
    
}
