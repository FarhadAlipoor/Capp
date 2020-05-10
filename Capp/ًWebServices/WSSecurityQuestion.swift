//
//  WSSecurityQuestion.swift
//  Capp
//
//  Created by tannaz on 12/4/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func getSecurityQuestions(_ success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        
        
        // call web service
        request(url: URLs.securityQuestion,resultType: JResSecurityQuestion.self, success: success, failure: failure , haveURLParams: false , needToken: false)
        
    }
}

