//
//  VerifyToPaymentVM.swift
//  Capp
//
//  Created by tannaz on 12/8/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

class VerifyToPaymentVM : MyVM {
    
    var invoice: JInvoice? = nil
    var resultToken: JPaymentToken? = nil
    var selectedPackageInfo: JPayPackage? = nil
    var discountResult: JDiscountCode? = nil
    
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
    
    func requestToCheckDiscountCode(_ code: String ,invoiceID: Int, onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.checkDiscountCode(invoiceID, code: code, success:{ (response) in
            if let discountRes = (response?.result as? JDiscountCode) {
                self.discountResult = discountRes
                onSuccess()
            }
        }, failure: onFailure)
    }
}

