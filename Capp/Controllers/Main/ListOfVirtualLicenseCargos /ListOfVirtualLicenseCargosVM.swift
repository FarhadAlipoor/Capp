//
//  ListOfVirtualLicenseCargosVM.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/9/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

class ListOfVirtualLicenseCargosVM: MyVM {
    
    var cargoVPs: [JVPSCargo]? = nil
    var distinations: [String] = []
    var cargosCosts: [Int] = []
    var cargoWeights: [String] = []
    var cargosType: [String] = []
    var filterVPS: [JVPSCargo]? = nil
    
    func requestToGetCargoPermit( onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        let terminalID = Globals.shared.selectedTerminal.id
        WebServices.getCargoVTS(terminalID, success:   { (response) in
            if let cargoVPS = (response?.result as? JResVPSCargos)?.cargos{
                self.cargoVPs = cargoVPS
                onSuccess()
            }
        }, failure: onFailure)
    }
}
