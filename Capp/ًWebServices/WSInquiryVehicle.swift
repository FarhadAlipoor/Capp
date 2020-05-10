//
//  WSInquiryVehicle.swift
//  Capp
//
//  Created by tannaz on 1/1/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func inquiryVehicle(_ plateNo: Int, plateSerialNo: Int, vehicleCardNo: Int,
                              success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        
        // generate params
        let params = ["PlateNo": plateNo,
                      "PlateSerialNo": plateSerialNo,
                      "VehicleCardNo": vehicleCardNo,
                      ] as [String : Any]
        // call web service
        request(url: URLs.inquiryVehicle, params: params, resultType: JResVehicleInquiry.self ,success: success, failure: failure , haveURLParams: false , needToken: false)
        
    }
    
}
