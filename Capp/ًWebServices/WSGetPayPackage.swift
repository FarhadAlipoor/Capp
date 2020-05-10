//
//  WSGetPayPackage.swift
//  Capp
//
//  Created by tannaz on 2/18/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func getPackage(_ packageTypeID: Int , success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        let params = ["TerminalID": packageTypeID,
                      "PackageTypeID": Globals.shared.selectedTerminal.id,
                      ] as [String : Any]
        
        // call web service
        request(url: URLs.getPayPackage, params: params ,resultType: JResPackages.self ,success: success, failure: failure , haveURLParams: false)
    }
}
