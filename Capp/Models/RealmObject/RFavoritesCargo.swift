//
//  RFavoritesCargo.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/27/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

// MARK: Model

final class RFavoritesCargo: Object {
    
   @objc dynamic var cargo              = ""
   @objc dynamic var cargoCost          = 0
   @objc dynamic var cargoNo            = 0
   @objc dynamic var company            = ""
   @objc dynamic var vpsDescription     = ""
   @objc dynamic var distination        = ""
   @objc dynamic var endDateTime        = ""
   @objc dynamic var loading            = ""
   @objc dynamic var masterID           = 0
   @objc dynamic var remain             = 0
   @objc dynamic var weight             = ""
   @objc dynamic var minWeight          = 0
   @objc dynamic var maxWeight          = 0
   @objc dynamic var city               = ""
   @objc dynamic var package            = ""
    
    override static func primaryKey() -> String? {
        return "masterID"
    }
    
    var cargoVPS: JVPSCargo {
        get {
            var cargoVPS = JVPSCargo()
            cargoVPS.cargo = cargo
            cargoVPS.cargoCost = cargoCost
            cargoVPS.maxWeight = maxWeight
            cargoVPS.minWeight = minWeight
            cargoVPS.city = city
            cargoVPS.package = package
            cargoVPS.weight = weight
            cargoVPS.remain = remain
            cargoVPS.masterID = masterID
            cargoVPS.loading = loading
            cargoVPS.endDateTime = endDateTime
            cargoVPS.distination = distination
            cargoVPS.description = vpsDescription
            cargoVPS.company = company
            cargoVPS.cargoNo = cargoNo
            
            return cargoVPS
        }
    }
    
    static func with(jVPSCargo: JVPSCargo) -> RFavoritesCargo {
        let rVPSCargo = RFavoritesCargo()

        rVPSCargo.cargo = jVPSCargo.cargo
        rVPSCargo.cargoCost = jVPSCargo.cargoCost
        rVPSCargo.maxWeight = jVPSCargo.maxWeight
        rVPSCargo.minWeight = jVPSCargo.minWeight
        rVPSCargo.city = jVPSCargo.city
        rVPSCargo.package = jVPSCargo.package
        rVPSCargo.weight = jVPSCargo.weight
        rVPSCargo.remain = jVPSCargo.remain
        rVPSCargo.masterID = jVPSCargo.masterID
        rVPSCargo.loading = jVPSCargo.loading
        rVPSCargo.endDateTime = jVPSCargo.endDateTime
        rVPSCargo.distination = jVPSCargo.distination
        rVPSCargo.vpsDescription = jVPSCargo.description
        rVPSCargo.company = jVPSCargo.company
        rVPSCargo.cargoNo = jVPSCargo.cargoNo
        return rVPSCargo
    }
    
    static func convertJVps( _ rCargo: RFavoritesCargo) -> JVPSCargo {
        var JCargo = JVPSCargo()
        JCargo.cargo = rCargo.cargo
        JCargo.cargoCost = rCargo.cargoCost
        JCargo.maxWeight = rCargo.maxWeight
        JCargo.minWeight = rCargo.minWeight
        JCargo.city = rCargo.city
        JCargo.package = rCargo.package
        JCargo.weight = rCargo.weight
        JCargo.remain = rCargo.remain
        JCargo.masterID = rCargo.masterID
        JCargo.loading = rCargo.loading
        JCargo.endDateTime = rCargo.endDateTime
        JCargo.distination = rCargo.distination
        JCargo.description = rCargo.vpsDescription
        JCargo.company = rCargo.company
        JCargo.cargoNo = rCargo.cargoNo
        return JCargo
    }
    
    
    static func addToFavoriteCargo(_ cargo: JVPSCargo) {
        let realm = try! Realm()
        try! realm.write {
            let rCargo = with(jVPSCargo: cargo)
            realm.add(rCargo, update: true)
        }
    }
    
   
    
    
    
}

