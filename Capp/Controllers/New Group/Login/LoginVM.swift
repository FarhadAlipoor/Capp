//
//  LoginVM.swift
//  Capp
//
//  Created by tannaz on 11/19/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

class LoginVM: MyVM {
    
    func requestToLoginDriver(_ driverCard: Int , password: String , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.loginDriver(driverCard, password: password, success: { (response) in
            onSuccess()
        }, failure: onFailure)
        
    }
    
    func requestToGetProfileInfo(onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getProfileInfo( { (response) in
            if let user = (response?.result as? JResDriver) {
                StoringData.user = user
            }
            onSuccess()
        }, failure: onFailure)
    }
    
    var items: [JVehicle]? = []
    func getAllVehicle( onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getAllVahicle(  { (response) in
            
            if let vehicles = (response?.result as? JResVehicles)?.vehicles {
                self.items? = vehicles
                onSuccess()
            }
        }, failure: onFailure)
    }
   
}
