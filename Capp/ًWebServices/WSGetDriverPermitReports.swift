//
//  WSGetDriverPermitReports.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

extension WebServices {
    
    static func getDriverPermitReports(_ terminalID: Int ,success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        
        // generate params
        let params = ["TerminalID": terminalID] as [String : Any]
        
        // call web service
        request(url: URLs.permitReports, params:params ,resultType: JResPermitReports.self ,success: success, failure: failure , haveURLParams: true)
    }
}
