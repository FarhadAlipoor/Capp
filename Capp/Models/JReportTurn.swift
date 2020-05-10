//
//  JReportTurn.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/9/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JReportTurn: ArrowParsable {
    
    var turnNom                         = Int()
    var plateNom                        = Int()
    var plateSerialNo                   = Int()
    var trailerTypeID                   = Int()
    var status                          = String()
    var date                            = String()
    
    init() {}
    
    mutating func deserialize(_ json: JSON) {
         turnNom                             <-- json["TurnNo"]
         plateNom                            <-- json["PlateNo"]
         plateSerialNo                       <-- json["PlateSerial"]
         trailerTypeID                       <-- json["TrailerTypeCode"]
         status                              <-- json["Status"]
         date                                <-- json["DateTime"]
        
        
    }
    
    init?(warehouse: Warehouseable) {
        self.turnNom = warehouse.get("TurnNo") ?? 0
        self.plateNom = warehouse.get("PlateNo") ?? 0
        self.plateSerialNo = warehouse.get("PlateSerial") ?? 0
        self.trailerTypeID = warehouse.get("TrailerTypeID") ?? 0
        self.status = warehouse.get("Status") ?? ""
        self.date = warehouse.get("DateTime") ?? ""
    }
    
    static func parseRes(_ dictionary: Any?) -> JReportTurn {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JReportTurn()
            one.deserialize(json)
            return one
        }
        return JReportTurn()
    }
    
}
