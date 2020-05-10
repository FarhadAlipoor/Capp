//
//  WSGetAllTrailerVehicle.swift
//  Capp
//
//  Created by tannaz on 12/31/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func requestToGetAllTrailerVehicle(_ vehicleCardNo: Int ,success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        let params = ["VehicleCardNo": vehicleCardNo] as [String : Any]
        
        // call web service
        request(url: URLs.getAllTrrailerVehicle, params: params ,resultType: JResTrailers.self ,success: success, failure: failure , haveURLParams: true)
        
    }
}
