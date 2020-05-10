//
//  WSGetInviteCode.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/26/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func getInviteCode(_ success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
     
        
        // call web service
        request(url: URLs.getInviteCode , resultType: JInvitedCode.self,success: success, failure: failure , haveURLParams: false , needToken: false)
    }
}
