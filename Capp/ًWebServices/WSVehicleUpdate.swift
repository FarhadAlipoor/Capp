//
//  WSVehicleUpdate.swift
//  Capp
//
//  Created by tannaz on 1/1/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

extension WebServices {
    
    static func updateVehicle(_ vehicleCardNo: Int, trailerTypeID: Int,
                              isActive:Bool,
                              success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        
        // generate params
        let params = ["VehicleCardNo": vehicleCardNo,
                      "TrailerTypeID": trailerTypeID,
                      "isActive": isActive,
                      ] as [String : Any]
        // call web service
        request(url: URLs.updateVehicle, params: params, success: success, failure: failure , haveURLParams: false)
        
    }
    
}
