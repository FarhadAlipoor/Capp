//
//  CargosDetailsVM.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/9/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

class CargosDetailsVM: MyVM {
    
    enum Mode: String {
        case saloon          = "Saloon"
        case permit          = "Permit"
    }
    var detailsMode: Mode = .permit
    var vpsCargo: JVPSCargo? = nil
    var vps: JPermitVPSResponse? = nil
    func requestToAddPermit( onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.addPermit(Globals.shared.selectedTerminal.id , masterID: vpsCargo?.masterID ?? 0 , success:  { (response) in
            if let cargoVPS = (response?.result as? JPermitVPSResponse){
                self.vps = cargoVPS
                onSuccess()
            }
        }, failure: onFailure)
    }
}

