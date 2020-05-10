//
//  RecoveryPasswordTypeVM.swift
//  Capp
//
//  Created by tannaz on 12/8/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

class RecoveryPasswordTypeVM: MyVM {
    
    func requestToRecoveryPassword(_ driverCard: Int , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.requestToChangePassword(driverCard, success: { (response) in
            onSuccess()
            
        }, failure: onFailure)
        
    }
    
}

