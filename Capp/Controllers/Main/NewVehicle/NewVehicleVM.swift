//
//  NewVehicleVM.swift
//  Capp
//
//  Created by tannaz on 12/29/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

class NewCehicleVM: MyVM {
    var vehicleInquiry: JResVehicleInquiry? = nil
    
    func requestToInquiryVehicle(_ plateNo: Int, plateSerialNo: Int, vehicleCardNo: Int,onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        print(plateNo)
        WebServices.inquiryVehicle(plateNo, plateSerialNo: plateSerialNo, vehicleCardNo: vehicleCardNo, success: { (response) in
            if let vehicle = (response?.result as? JResVehicleInquiry) {
                self.vehicleInquiry = vehicle
                onSuccess()
            }
        }, failure: onFailure)
        
    }
}
