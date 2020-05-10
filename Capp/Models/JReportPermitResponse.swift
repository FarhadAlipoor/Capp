//
//  JReportPermitResponse.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/21/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow
struct JReportPermitResponse: ArrowParsable {
    
    var permitNo                        = Int()
    var turnNo                          = Int()
    var plateNo                         = String()
    var plateSerial                     = Int()
    var company                         = String()
    var city                            = String()
    var weight                          = Int()
    var transportRate                   = Int()
    var cargo                           = String()
    var trailerTypeID                   = Int()
    var dateTime                        = String()
    init() {}
    
    mutating func deserialize(_ json: JSON) {
        permitNo                           <-- json["PermitNo"]
        turnNo                             <-- json["TurnNo"]
        plateNo                            <-- json["PlateNo"]
        plateSerial                        <-- json["PlateSerial"]
        company                            <-- json["Company"]
        city                               <-- json["City"]
        weight                             <-- json["Weight"]
        transportRate                      <-- json["TransportRate"]
        trailerTypeID                      <-- json["TrailerTypeCode"]
        cargo                              <-- json["Cargo"]
        dateTime                           <-- json["DateTime"]
    }
    
    init?(warehouse: Warehouseable) {
        self.permitNo = warehouse.get("PermitNo") ?? 0
        self.turnNo = warehouse.get("TurnNo") ?? 0
        self.plateNo = warehouse.get("PlateNo") ?? ""
        self.plateSerial = warehouse.get("PlateSerial") ?? 0
        self.company = warehouse.get("Company") ?? ""
        self.city = warehouse.get("City") ?? ""
        self.weight = warehouse.get("Weight") ?? 0
        self.transportRate = warehouse.get("TransportRate") ?? 0
        self.trailerTypeID = warehouse.get("TrailerTypeID") ?? 0
        self.cargo = warehouse.get("Cargo") ?? ""
        self.dateTime = warehouse.get("DateTime") ?? ""

    }
    
    static func parseRes(_ dictionary: Any?) -> JReportPermitResponse {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JReportPermitResponse()
            one.deserialize(json)
            return one
        }
        return JReportPermitResponse()
    }
    
}
