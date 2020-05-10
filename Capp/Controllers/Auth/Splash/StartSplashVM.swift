//
//  StartSplashVM.swift
//  Capp
//
//  Created by tannaz on 4/4/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

class StartSplashVM: MyVM {
    
    var terminals: [JTerminalResponse]? = nil
    var menuItems: [JTerminalMenu]? = nil

    func requestToGetAllTerminals(onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getAllTerminals(success:   { (response) in
            if let allTerminals = (response?.result as? JResTerminals)?.terminals{
                StoringData.terminals = self.terminals
                self.terminals = allTerminals
                Globals.shared.terminals = self.terminals!
                onSuccess()
            }
        }, failure: onFailure)
    }
    
    func requestToGetTerminalMenuItem(_ terminaleID: Int , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure ) {
        WebServices.getAllTerminalMenuItems(terminaleID, success:  { (response) in
            if let terminalMenuItems = (response?.result as? JResTerminalMenu)?.terminalMenu {
                self.menuItems = terminalMenuItems
                onSuccess()
            }
        }, failure: onFailure)
    }
    func requestToLoginUser(_ username: Int , password: String , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
            WebServices.loginDriver(username, password: password, success: { (response) in
                StoringData.driverNo = username
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
}
