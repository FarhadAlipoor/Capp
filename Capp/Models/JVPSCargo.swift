//
//  JVPSCargo.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/21/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow
struct JVPSCargo: ArrowParsable {
    
    var cargo           = String()
    var cargoCost       = Int()
    var cargoNo         = Int()
    var company         = String()
    var description     = String()
    var distination     = String()
    var endDateTime     = String()
    var loading         = String()
    var masterID        = Int()
    var remain          = Int()
    var weight          = String()
    var minWeight       = Int()
    var maxWeight       = Int()
    var city            = String()
    var package         = String()
    var startDate       = String()

    init() {}

    
    mutating func deserialize(_ json: JSON) {
        cargo                           <-- json["Cargo"]
        cargoCost                       <-- json["CargoCost"]
        cargoNo                         <-- json["CargoNo"]
        company                         <-- json["Company"]
        description                     <-- json["Description"]
        distination                     <-- json["Distination"]
        endDateTime                     <-- json["EndDateTime"]
        loading                         <-- json["Loading"]
        masterID                        <-- json["MasterID"]
        remain                          <-- json["Remain"]
        weight                          <-- json["Weight"]
        minWeight                       <-- json["MinWeight"]
        maxWeight                       <-- json["MaxWeight"]
        city                            <-- json["City"]
        package                         <-- json["Package"]
        
    }
    
    init?(warehouse: Warehouseable) {
        self.cargo = warehouse.get("Cargo") ?? ""
        self.cargoCost = warehouse.get("CargoCost") ?? 0
        self.cargoNo = warehouse.get("CargoNo") ?? 0
        self.company = warehouse.get("Company") ?? ""
        self.description = warehouse.get("Description") ?? ""
        self.distination = warehouse.get("Distination") ?? ""
        self.weight = warehouse.get("Weight") ?? ""
        self.endDateTime = warehouse.get("EndDateTime") ?? ""
        self.loading = warehouse.get("Loading") ?? ""
        self.masterID = warehouse.get("MsterID") ?? 0
        self.remain = warehouse.get("Remain") ?? 0
        
    }
    
    static func parseRes(_ dictionary: Any?) -> JVPSCargo {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JVPSCargo()
            one.deserialize(json)
            return one
        }
        return JVPSCargo()
    }
}
