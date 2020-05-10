//
//  WSGetAllVehicle.swift
//  Capp
//
//  Created by tannaz on 12/24/17.
//  Copyright © 2017 Capp. All rights reserved.
//


import ReachabilitySwift
import Alamofire
import Arrow

extension WebServices {
    
    static func getAllVahicle(_ success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        //GeneralFunctions.showProgress()
        
        // generate params

        // call web service
        request(url: URLs.getAllVehiclesForMember, resultType: JResVehicles.self, success: success, failure: failure , haveURLParams: false , needToken : true)
        
    }
}
