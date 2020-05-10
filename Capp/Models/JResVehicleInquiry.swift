//
//  JResVehicleInquiry.swift
//  Capp
//
//  Created by tannaz on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JResVehicleInquiry: ArrowParsable {
    
    var plateNo                    = Int()
    var plateSerialNo              = Int()
    var systemName                 = String()
    var cardNo                     = Int()
    var vin                        = String()
    var docNomber                  = Int()
    var shasiNom                   = String()
    var trailerTypeId              = Int()
    var isActiveOrg                = Bool()
    
    init() {}
    
    mutating func deserialize(_ json: JSON) {
        
        plateNo                             <-- json["PlateNo"]
        plateSerialNo                       <-- json["PlateSerialNo"]
        systemName                          <-- json["SystemName"]
        cardNo                              <-- json["CardNo"]
        vin                                 <-- json["VIN"]
        docNomber                           <-- json["DocNumber"]
        shasiNom                            <-- json["ShasiNo"]
        trailerTypeId                       <-- json["TrailerTypeID"]
        isActiveOrg                         <-- json["IsActiveOrg"]
        
    }
    
    init?(warehouse: Warehouseable) {
        self.plateNo = warehouse.get("PlateNo") ?? 0
        self.plateSerialNo = warehouse.get("PlateSerialNo") ?? 0
        self.systemName = warehouse.get("SystemName") ?? ""
        self.cardNo = warehouse.get("CardNo") ?? 0
        self.vin = warehouse.get("VIN") ?? ""
        self.docNomber = warehouse.get("DocNumber") ?? 0
        self.shasiNom = warehouse.get("ShasiNo") ?? ""
        self.trailerTypeId = warehouse.get("TrailerTypeID") ?? 0
        self.isActiveOrg = warehouse.get("IsActiveOrg") ?? false
    }
    
    static func parseRes(_ dictionary: Any?) -> JResVehicleInquiry {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JResVehicleInquiry()
            one.deserialize(json)
            return one
        }
        return JResVehicleInquiry()
    }
}
