//
//  WSLogin.swift
//  Capp
//
//  Created by tannaz on 12/15/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import ReachabilitySwift
import Alamofire
import Arrow

extension WebServices {
    
    static func loginDriver(_ driverNom: Int, password: String , success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        
       // GeneralFunctions.showProgress()
        let myVc = MyVC()
        myVc.showLoading()
        // generate params
        let deviceInfo = ["deviceName": UIDevice.current.model,
                          "OnVersion": UIDevice.version(),
                          "OsType": 2] as [String : Any]
        let params = ["driverCardNo": driverNom,
                      "password": password ,
                      "DeviceInfo": deviceInfo ,
                      "fcmID": StoringData.fcmToken ?? " "
            ] as [String : Any]
        // call web service
        request(url: URLs.login, params: params, resultType: JResLogin.self, success: success, failure: failure , haveURLParams: false , needToken: false )
        
    }
}
