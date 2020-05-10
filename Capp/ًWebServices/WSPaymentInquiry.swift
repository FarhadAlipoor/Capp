//
//  WSPaymentInquiry.swift
//  Capp
//
//  Created by tannaz on 2/20/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func paymentInquiry(_ termianlId: Int , pecToken: String , success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        let params = ["PecToken": pecToken,
                      "TerminalID": termianlId,
                      ] as [String : Any]
        
        // call web service
        request(url: URLs.inquiryPay, params: params ,resultType: JResponse.self ,success: success, failure: failure , haveURLParams: false)
    }
}
