//
//  RecoveryPasswordBySmsVM.swift
//  Capp
//
//  Created by tannaz on 12/15/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

class RecoveryPasswordBySmsVM: MyVM {
    
    func requestToRecoverPassBySMS(_ driverCard: Int , onSuccess: @escaping () -> Void, onFailure: @escaping WebServices.Failure) {
        WebServices.requestToChangePasswordbySMS(driverCard, success: { (response) in
            onSuccess()
            
         }, failure: onFailure)
    }
    
    func requestToCheckRecoveryBySMS(_ driverCard: Int , code: String , onSuccess: @escaping () -> Void, onFailure: @escaping WebServices.Failure) {
        WebServices.checkRecoverPassSMS(driverCard, code: code, success: { (response) in
            onSuccess()
            
         }, failure: onFailure)
    }
}

