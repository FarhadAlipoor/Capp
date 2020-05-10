//
//  JVehicle.swift
//  Capp
//
//  Created by tannaz on 12/24/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JVehicle: ArrowParsable {
    
    var vehicleCardNo                   = Int()
    var plateNo                         = Int()
    var plateSerialNo                   = Int()
    var isActiveOrg                     = Bool()
    var isActiveCapp                    = Bool()
    var trailerTypeID                   = Int()
    var trailerType                     = [JTrailer]()
    init() {}
    
    mutating func deserialize(_ json: JSON) {
        
        vehicleCardNo                       <-- json["VehicleCardNo"]
        plateNo                             <-- json["PlateNo"]
        plateSerialNo                       <-- json["PlateSerialNo"]
        isActiveOrg                         <-- json["IsActiveOrg"]
        isActiveCapp                        <-- json["IsActiveCapp"]
        trailerTypeID                       <-- json["TrailerTypeID"]
        
    }
    
    init?(warehouse: Warehouseable) {
        self.vehicleCardNo = warehouse.get("LicenceNo") ?? 0
        self.plateNo = warehouse.get("PlateNo") ?? 0
        self.plateSerialNo = warehouse.get("PlateSerialNo") ?? 0
        self.trailerTypeID = warehouse.get("TrailerTypeID") ?? 0
        self.isActiveCapp = warehouse.get("IsActiveCapp") ?? false
        self.isActiveOrg = warehouse.get("isActiveOrg") ?? false
    }
    
    static func parseRes(_ dictionary: Any?) -> JVehicle {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JVehicle()
            one.deserialize(json)
            return one
        }
        return JVehicle()
    }
}
