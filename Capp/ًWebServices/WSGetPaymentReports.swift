//
//  WSGetPaymentReports.swift
//  Capp
//
//  Created by Tannaz Parsa on 3/3/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func getPaymentReports(_ success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        // call web service
        request(url: URLs.paymentReports , resultType: JResReportPayment.self,success: success, failure: failure , haveURLParams: false)
    }
}
