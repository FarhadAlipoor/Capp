//
//  WSGetCargoSaloon.swift
//  Capp
//
//  Created by tannaz on 2/8/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

extension WebServices {
    
    static func getCargoSaloon(_ terminalID: Int ,success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        
        // generate params
        let params = ["TerminalID": terminalID] as [String : Any]
        
        // call web service
        request(url: URLs.getCargoSaloon, params:params ,resultType: JResSaloonCargo.self ,success: success, failure: failure , haveURLParams: true)
    }
}

