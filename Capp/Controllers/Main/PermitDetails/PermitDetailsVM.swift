//
//  PermitDetailsVM.swift
//  Capp
//
//  Created by tannaz on 2/9/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

class PermitDetailsVM: MyVM {
    
    var permit: JPermitVPSResponse? = nil
    
    func invalidPermit(onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.invalidatePermit(Globals.shared.selectedTerminal.id, success:  { (response) in
                onSuccess()
            
        }, failure: onFailure)
    }
}
