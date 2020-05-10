//
//  WSVehicleSubmit.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func submitVehicle(_ vehicleCardNo: Int,trailerTypeID: Int,
                               success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        
        // generate params
        let params = ["VehicleCardNo": vehicleCardNo,
                      "TrailerTypeID": trailerTypeID,
                      ] as [String : Any]
        // call web service
        request(url: URLs.submitVehicle, params: params ,success: success, failure: failure , haveURLParams: false)
        
    }
    
}
