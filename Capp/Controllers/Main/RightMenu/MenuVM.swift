//
//  MenuVM.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/25/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

class MenuVM : MyVM{
    
    func requestToLogoutUser(onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.userLogout( { (response) in
            onSuccess()
        }, failure: onFailure)
        
    }
    
    var packageTypes: [JResPackageType]? = nil
    var packages: [JPayPackage]? = nil
    func requestToGetPackage(_ onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getPackage( 0 , success: { (response) in
            if let packagesRes = (response?.result as? JResPackages)?.packages  {
                StoringData.packages = packagesRes
                self.packages = packagesRes
                onSuccess()
            }
        }, failure: onFailure)
    }
}
