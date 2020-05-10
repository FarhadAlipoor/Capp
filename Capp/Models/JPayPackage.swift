//
//  JPayPackage.swift
//  Capp
//
//  Created by tannaz on 2/18/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JPayPackage: ArrowParsable , Storable{
  
    var packageID           = Int()
    var amount              = Int()
    var title               = String()
    var description         = String()
    var nameDate            = String()
    var isCapp              = Bool()

    init() {}
    mutating func deserialize(_ json: JSON) {
        amount              <-- json["Amount"]
        packageID           <-- json["PackageID"]
        title               <-- json["PackageTitle"]
        description         <-- json["PackageDescription"]
        nameDate            <-- json["PackageNameDate"]
        isCapp              <-- json["IsCapp"]
    }
    
    init?(warehouse: Warehouseable) {
            self.packageID = warehouse.get("packageID") ?? 0
            self.title = warehouse.get("title") ?? ""
            self.description = warehouse.get("description") ?? ""
            self.amount = warehouse.get("amount") ?? 0
            self.nameDate = warehouse.get("nameDate") ?? ""
            self.isCapp = warehouse.get("isCapp") ?? false
        
    }
    
    
}
