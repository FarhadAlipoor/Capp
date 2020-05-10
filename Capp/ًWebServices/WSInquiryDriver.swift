//
//  WSInquiryDriver.swift
//  Capp
//
//  Created by tannaz on 11/29/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

extension WebServices {
    
    static func inquiryDriver(_ driverNom: Int, nationalCode: String,
                      success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        // generate params
        let params = ["driverCardNo": driverNom,
                      "nationalCode": nationalCode,
            ] as [String : Any]
        // call web service
        request(url: URLs.inquiryDriver, params: params, resultType: JResDriver.self, success: success, failure: failure , haveURLParams: false , needToken: false)
        
    }
    
}
