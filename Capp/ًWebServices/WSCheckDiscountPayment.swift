//
//  WSCheckDiscountPayment.swift
//  Capp
//
//  Created by tannaz on 2/20/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func checkDiscountCode(_ invoiceID: Int , code: String , success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        let params = ["InvoiceID": invoiceID,
                      "Code": code,
                      ] as [String : Any]
        
        // call web service
        request(url: URLs.checkDiscountCode, params: params ,resultType: JDiscountCode.self ,success: success, failure: failure , haveURLParams: false)
    }
}
