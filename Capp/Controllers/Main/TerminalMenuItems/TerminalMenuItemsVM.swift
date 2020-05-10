//
//  TerminalMenuItemsVM.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

class TerminalMenuItemsVM: MyVM {
    
    var menuItems: [JTerminalMenu]? = nil
    var terminals: [JTerminalResponse]? = nil
    var selectedTerminal: JTerminalResponse? = nil
    var packageTypes: [JResPackageType]? = nil
    var cargoVPS: JPermitVPSResponse? = nil
    
    func requestToGetPermit(onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getPermit(Globals.shared.selectedTerminal.id , success:  { (response) in
            if let cargoVPS = (response?.result as? JPermitVPSResponse){
                self.cargoVPS = cargoVPS
                onSuccess()
            }
        }, failure: onFailure)
    }
    
    func reqToGetPackageType(onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getPackageType(  { (response) in
            if let packagesRes = (response?.result as? JResPackageTypes)?.packagesType  {
                self.packageTypes = packagesRes
                onSuccess()
            }
            
        }, failure: onFailure)
        
    }
}
