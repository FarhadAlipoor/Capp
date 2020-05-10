//
//  WSChangePassBySecurityQuestion.swift
//  Capp
//
//  Created by tannaz on 12/15/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func requestToChangePasswordbySecurityQuestion(_ driverCardNo: Int ,success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        let params = ["driverCardNo": driverCardNo] as [String : Any]
        
        // call web service
        request(url: URLs.recoverPassBySecQuestion, params: params ,resultType: JResSecurityQuestion.self,success: success, failure: failure , haveURLParams: true , needToken: false)
        
    }
}
