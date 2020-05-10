//
//  WSAddPermit.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/21/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

extension WebServices {
    
    static func addPermit(_ terminalID: Int ,masterID: Int ,success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        
        
        // generate params
        let params = ["TerminalID": terminalID ,
                      "MasterID": masterID] as [String : Any]
        
        // call web service
        request(url: URLs.addPermit, params:params ,resultType: JPermitVPSResponse.self ,success: success, failure: failure , haveURLParams: false)
        
    }
}
