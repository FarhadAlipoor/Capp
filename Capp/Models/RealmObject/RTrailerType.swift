//
//  RTrailerType.swift
//  Capp
//
//  Created by tannaz on 12/24/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

// MARK: Model

final class RTrailerType: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var maxWeight = 0
    @objc dynamic var minWeight = 0
    @objc dynamic var code = 0
    @objc dynamic var id = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    var trailerType: JTrailerType {
        get {
            var trailer = JTrailerType()
            trailer.id = id
            trailer.name = name
            trailer.maxWeight = maxWeight
            trailer.minWeight = minWeight
            trailer.code = code
            return trailer
        }
    }
    
    static func with(jtrailerType: JTrailerType) -> RTrailerType {
        let rRegion = RTrailerType()
        rRegion.id = jtrailerType.id
        rRegion.name = jtrailerType.name
        rRegion.code = jtrailerType.code
        rRegion.maxWeight = jtrailerType.maxWeight
        rRegion.minWeight = jtrailerType.minWeight
        return rRegion
    }
    
    // saves array of JRegions
    static func saveWith(_ jTrailers: [JTrailerType], ID: Int) {
        let realm = try! Realm()
        try! realm.write {
            for var trailer in jTrailers {
                trailer.id = ID
                let rRegion = with(jtrailerType: trailer)
                realm.create(RTrailerType.self, value: rRegion, update: true)
            }
        }
    }
    
    //save array of Trailers
    static func addAllTrailers() {
        let url = Bundle.main.url(forResource: "TrailerType", withExtension: "json")!
        do {
            let jsonData = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: jsonData) as? [[String:Any]]
            let realm = try! Realm()
            for arr in json! {
                guard let id = arr["id"] as? Int,
                    let code = arr["code"] as? Int,
                    let minWeight = arr["minWeight"] as? Int,
                    let maxWeight = arr["maxWeight"] as? Int,
                    let name = arr["name"] as? String else { continue }
                let trailer = RTrailerType()
                trailer.code = code
                trailer.id = id
                trailer.name = name
                trailer.maxWeight = maxWeight
                trailer.minWeight = minWeight
                try! realm.write {
                    realm.add(trailer, update: true)
                }
            }
        }
        catch {
            print(error)
        }
    }
    
    // return RRegion with id
    static func getWith(id: Int) -> RTrailerType? {
        let realm = try! Realm()
        return realm.objects(RTrailerType.self).filter("id = \(id)").first
    }
    
    static func getWithName(name:String) -> RTrailerType? {
        let realm = try! Realm()
        return realm.objects(RTrailerType.self).filter("name = \(name)").first
    }
    

}

