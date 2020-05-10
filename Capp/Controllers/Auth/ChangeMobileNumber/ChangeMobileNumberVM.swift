//
//  ChangeMobileNumberVM.swift
//  Capp
//
//  Created by tannaz on 12/14/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

class ChangeMobileNumberVM: MyVM {
    
    var phoneNumber: Int? = nil
    var driverCardNum: Int? = nil
    
    func requestToChangePhoneNumber(_ driverNo: Int , mobileNom: Int , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.changePhoneNumber(driverNo, phoneNom: mobileNom, success: { (response) in
            
            onSuccess()
            
        }, failure: onFailure)
        
    }
    
    func requestToSendMobileVerificationCode(_ driverCardNo: Int , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getVerificationCode(driverCardNo, success: { (response) in
            onSuccess()
        }, failure: onFailure)
    }
}
