//
//  ShowCargoSaloonVM.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/22/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class ShowCargoSaloonVM: MyVM {
    
    var cargos: [JVPSCargo]? = nil
    var saloonCargo: JResSaloonCargo? = nil
    func getSaloonCargo(onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getCargoSaloon(Globals.shared.selectedTerminal.id, success:  { (response) in
            if let salonCargo = (response?.result as? JResSaloonCargo) {
                self.saloonCargo = salonCargo
                self.cargos = salonCargo.salonCargo
                onSuccess()
            }
        }, failure: onFailure)
    }
}
