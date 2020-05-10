//
//  MobileVerificationVM.swift
//  Capp
//
//  Created by tannaz on 12/8/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

class MobileVerificationVM: MyVM {
    
    var mobileNumber = Int()
    var driverCardNumber: Int? = nil
    
    func requestToSendMobileVerificationCode(_ driverCardNo: Int , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getVerificationCode(driverCardNo, success: { (response) in
            onSuccess()            
        }, failure: onFailure)
    }
    
    func requestToCheckVerificationCode(_ driverCardNo: Int , code: String , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.checkVerificationCode(driverCardNo, code: code, success: { (response) in
            onSuccess()
        }, failure: onFailure)
    }
    
}

