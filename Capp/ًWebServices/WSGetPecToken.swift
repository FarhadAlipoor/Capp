//
//  WSGetPecToken.swift
//  Capp
//
//  Created by tannaz on 2/14/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import ReachabilitySwift
import Alamofire
import Arrow

extension WebServices {
    
    static func getPecToken(_ invoiceID: Int, success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        let params = ["InvoiceID": invoiceID
                      ] as [String : Any]
        
     //   GeneralFunctions.showProgress()
        
        
        // call web service
        request(url: URLs.getPayPecToken, params: params,  resultType: JPaymentToken.self, success: success, failure: failure , haveURLParams: true)
        
    }
}
