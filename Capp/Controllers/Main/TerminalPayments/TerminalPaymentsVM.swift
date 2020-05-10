//
//  TerminalPaymentsVM.swift
//  Capp
//
//  Created by tannaz on 2/10/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
class TerminalPaymentsVM: MyVM {
    
    var packageTypes: [JResPackageType]? = nil
    var packages: [JPayPackage]? = nil
    func requestToGetPackage(_ packageTypeID : Int,onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getPackage( packageTypeID , success: { (response) in
            if let packagesRes = (response?.result as? JResPackages)?.packages  {
                self.packages = packagesRes
                onSuccess()
            }
        }, failure: onFailure)
    }
}

