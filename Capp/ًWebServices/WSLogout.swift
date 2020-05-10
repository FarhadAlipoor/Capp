//
//  WSLogout.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/25/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func userLogout(_ success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        // call web service
        request(url: URLs.logout,resultType: JResponse.self ,success: success, failure: failure , haveURLParams: false , needToken: false)
    }
}
