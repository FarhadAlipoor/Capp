//
//  WSGetRegisterInvoice.swift
//  Capp
//
//  Created by tannaz on 2/14/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import ReachabilitySwift
import Alamofire
import Arrow

extension WebServices {
    
    static func getRegisterInvoice(_ success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        
        
        // call web service
        request(url: URLs.getPayRegisterInvoice,  resultType: JInvoice.self, success: success, failure: failure , haveURLParams: true)
        
    }
}
