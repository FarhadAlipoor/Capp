//
//  ChangePasswordVM.swift
//  Capp
//
//  Created by tannaz on 12/15/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

class ChangePasswordVM: MyVM {
    
    func reqToChangePassword(_ driverCard: Int , newPassword: String , onSuccess: @escaping () -> Void, onFailure: @escaping WebServices.Failure) {
        WebServices.requestToChangePassword(driverCard, newPassword: newPassword, success: { (response) in
            
                onSuccess()
            
         }, failure: onFailure)
    }
    
}
