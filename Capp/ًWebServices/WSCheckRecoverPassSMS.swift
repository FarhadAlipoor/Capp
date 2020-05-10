//
//  WSCheckRecoverPassSMS.swift
//  Capp
//
//  Created by tannaz on 12/15/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

extension WebServices {
    
    static func checkRecoverPassSMS(_ driverNom: Int, code: String,
                                      success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        
        // generate params
        let params = ["driverCardNo": driverNom,
                      "code": code,
                      ] as [String : Any]
        // call web service
        request(url: URLs.checkRecoverPassSMS, params: params, success: success, failure: failure , haveURLParams: false , needToken: false)
    }
    
}
