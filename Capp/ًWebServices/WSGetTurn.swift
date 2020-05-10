//
//  WSGetTurn.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/9/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

extension WebServices {
    
    static func getTurn(_ terminalID: Int ,success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        
        // generate params
        let params = ["TerminalID": terminalID] as [String : Any]
        
        // call web service
        request(url: URLs.getDriverTurn, params:params ,resultType: JReportTurn.self ,success: success, failure: failure , haveURLParams: true)
        
    }
}
