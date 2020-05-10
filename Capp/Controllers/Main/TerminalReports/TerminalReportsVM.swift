//
//  TerminalReportsVM.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

class TerminalReportsVM: MyVM {
 
    var turnsReports: [JReportTurn]? = nil
    var permitReports: [JPermitVPSResponse]? = nil
    var creditReports: JCreditReport? = nil
    var paymentReports: [JReportPayment]? = nil
    func requestToGetDriverTurnsReports(_ onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getDriverTurnReports(Globals.shared.selectedTerminal.id
            , success:{ (response) in
                if let turnReportsRes = (response?.result as? JResTurnsReports)?.turnsReports{
                    self.turnsReports = turnReportsRes
                    onSuccess()
                }
                
        }, failure: onFailure)
    }
    
    func requestToGetDriverPermitReports(_ onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        
        WebServices.getDriverPermitReports(Globals.shared.selectedTerminal.id, success: { (response) in
            if let permitReportsRes = (response?.result as? JResPermitReports)?.permitReports{
                self.permitReports = permitReportsRes
                onSuccess()
            }
            
        }, failure: onFailure)
        
    }
    
    func requestToGetDriverCreditReports(_ onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        
        WebServices.getDriverCreditReports(Globals.shared.selectedTerminal.id, success: { (response) in
            if let creditReportsRes = (response?.result as? JCreditReport){
                self.creditReports = creditReportsRes
                onSuccess()
            }
            
        }, failure: onFailure)
    }
    
    func requestToGetPaymentsReports(_  onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getPaymentReports({ (response) in
            if let paymentReportsRes = (response?.result as? JResReportPayment)?.paymentsReports{
                self.paymentReports = paymentReportsRes
                onSuccess()
            }
            
        }, failure: onFailure)
    }
}

