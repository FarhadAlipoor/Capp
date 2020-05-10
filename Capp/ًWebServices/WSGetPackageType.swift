//
//  WSGetPackageType.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func getPackageType(_ success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        // call web service
        request(url: URLs.getPayPackageType ,resultType: JResPackageTypes.self ,success: success, failure: failure , haveURLParams: false)
    }
}
