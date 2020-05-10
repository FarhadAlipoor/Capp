//
//  VehicleInquiryVM.swift
//  Capp
//
//  Created by tannaz on 12/31/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

class VehicleInquiryVM:MyVM {
    
    var vehicleDetails: JResVehicleInquiry? = nil

    func requestToSubmitVehicle(_ vehicleCardNo: Int , trailerTypeId: Int , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure ) {
        WebServices.submitVehicle(vehicleCardNo, trailerTypeID: trailerTypeId, success: { (response) in
                onSuccess()
            
        }, failure: onFailure)
    }
}
