//
//  EditVehicleVM.swift
//  Capp
//
//  Created by tannaz on 12/29/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
class EditVehicleVM: MyVM {
    
    var vehicle: JVehicle? = nil
    var trailer: RTrailerType? = nil
    var updateVehicleSuccessfull: (() -> Void)? = nil

    func requestToUpdateVehicle(_ vehicleCardNo: Int , trailerTypeID: Int , isActive: Bool , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        
        WebServices.updateVehicle(vehicleCardNo, trailerTypeID: trailerTypeID, isActive: isActive, success: { (response) in
            self.updateVehicleSuccessfull?()
                onSuccess()
            
        }, failure: onFailure)
    }
}
