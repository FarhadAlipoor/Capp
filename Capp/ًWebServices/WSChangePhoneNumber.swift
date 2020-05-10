//
//  WSChangePhoneNumber.swift
//  Capp
//
//  Created by tannaz on 12/14/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

extension WebServices {
    
    static func changePhoneNumber(_ driverNom: Int, phoneNom: Int,
                                      success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        
        // generate params
        let params = ["driverCardNo": driverNom,
                      "newPhoneNo": phoneNom,
                      ] as [String : Any]
        // call web service
        request(url: URLs.changePhoneNom, params: params, success: success, failure: failure , haveURLParams: false , needToken: false)
    }
}
