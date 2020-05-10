//
//  WSRegister.swift
//  Capp
//
//  Created by tannaz on 12/4/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import Alamofire
import Arrow

extension WebServices {
    
    static func registerDriver(_ driverNom: Int, nationalCode: String,passwor: String, sequrityQuestionID: Int ,securityAnswer: String , PhoneNo: Int , success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
        
        // generate params
        let deviceInfo = ["deviceName": UIDevice.current.model,
                          "OnVersion": UIDevice.version(),
                          "OsType": 2] as [String : Any]
        let params = ["driverCardNo": driverNom,
                      "password": passwor,
                      "SecurityQuestionID": sequrityQuestionID,
                      "SecurityAnswer": securityAnswer ,
                      "PhoneNo": PhoneNo ,
                      "fcmID": StoringData.fcmToken ?? " " ,
                      "DeviceInfo": deviceInfo
                      ] as [String : Any]
        // call web service
        request(url: URLs.register, params: params, resultType: JResDriver.self, success: success, failure: failure , haveURLParams: false , needToken: false)
        
    }
    
}
