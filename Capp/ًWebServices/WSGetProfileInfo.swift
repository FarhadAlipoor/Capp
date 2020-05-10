//
//  WSGetProfileInfo.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/25/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func getProfileInfo(_ success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }

        // call web service
        request(url: URLs.getProfileInfo,resultType: JResDriver.self ,success: success, failure: failure , haveURLParams: false )
    }
}
