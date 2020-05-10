//
//  RegisterInvoiceVM.swift
//  Capp
//
//  Created by tannaz on 4/12/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

class RegisterInvoiceVM: MyVM {
    
    var invoice: JInvoice? = nil
    var resultToken: JPaymentToken? = nil
    var selectedPackageInfo: JPayPackage? = nil
    
    func requestToGetRegisterInvoice(_ onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getRegisterInvoice(  { (response) in
            if let resInvoice = (response?.result as? JInvoice) {
                self.invoice = resInvoice
                
                onSuccess()
            }
        }, failure: onFailure)
    }
    
    func requestToGetPecToken(_ invoiceID: Int , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure ) {
        
        WebServices.getPecToken(invoiceID, success: { (response) in
            if let pecTokenRes = (response?.result as? JPaymentToken) {
                self.resultToken = pecTokenRes
                onSuccess()
            }
        }, failure: onFailure)
        
    }
    
    func requestToInquiryPayment(_ onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        
        WebServices.paymentInquiry(Globals.shared.selectedTerminal.id, pecToken: (resultToken?.pecToken) ?? "" , success:{ (response) in
            onSuccess()
            
        }, failure: onFailure)
    }
}
