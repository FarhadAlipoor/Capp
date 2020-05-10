//
//  WSGetAllTerminals.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func getAllTerminals( success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        
        // generate params

        // call web service
        request(url: URLs.getTerminals,resultType: JResTerminals.self ,success: success, failure: failure , haveURLParams: false , needToken: false)
        
    }
    
}
