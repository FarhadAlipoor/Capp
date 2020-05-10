//
//  WSReqChangePass.swift
//  Capp
//
//  Created by tannaz on 12/15/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    
    static func requestToChangePassword(_ driverCardNo: Int ,success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        let params = ["driverCardNo": driverCardNo] as [String : Any]
        
        // call web service
        request(url: URLs.reqChangePassword, params: params ,success: success, failure: failure , haveURLParams: true , needToken: false)
        
    }
}
