//
//  DriverLastTurnStatusVM.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/7/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

class DriverLastTurnStatusVM: MyVM {
    
    var terminal: JTerminalResponse? = nil
    var driverTurn: JReportTurn? = nil
    var vtsTurn: JVTSResponse? = nil
    
    func requestToGetTurn( onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getTurn((self.terminal?.id)!, success:   { (response) in
             if let turn = (response?.result as? JReportTurn) {
                self.driverTurn = turn
                onSuccess()
            }
            
        }, failure: onFailure)
    }
    
    func requestToInvalidTurn(onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.invalidVTSTurn((terminal?.id)!, success:   { (response) in
            onSuccess()
            
        }, failure: onFailure)
    }
    
    func requestToGetVTSTurn(onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getVTSTurn((terminal?.id)!, success:   { (response) in
            if let newturn = (response?.result as? JVTSResponse) {
                self.vtsTurn = newturn
                onSuccess()

            }
            
        }, failure: onFailure)
    }
}
