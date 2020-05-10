
//
//  VerifyToPayment.swift
//  Capp
//
//  Created by tannaz on 12/8/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit
import PecPayment

class VerifyToPaymentVC: MyVC  , DialogDelegate {
    
    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var lblPackageAmount: UILabel!
    @IBOutlet weak var lblExpireTime: UILabel!
    @IBOutlet weak var lblPackagePurchased: UILabel!
    @IBOutlet weak var lblInvitedPersonInCapp: UILabel!
    @IBOutlet weak var lblPersentOfInvited: UILabel!
    @IBOutlet weak var lblDiscountAmount: UILabel!
    @IBOutlet weak var tfDiscountCode: MyTextField!
    @IBOutlet weak var lblDiscountCodeAmount: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblFinalAmount: UILabel!
    let viewModel = VerifyToPaymentVM()
    var paymentMsg = String()
    var initpayment = InitPayment()
    
    func configure(_ package: JPayPackage) {
        viewModel.selectedPackageInfo = package
    }
    
    
    @IBAction func btnApplyDiscountPressed(_ sender: Any) {
        showLoading()
        viewModel.requestToCheckDiscountCode(tfDiscountCode.text ?? "", invoiceID: (viewModel.invoice?.invoiceID)!, onSuccess: successToChackDiscountCode, onFailure: failure)
    }
    
    func successToChackDiscountCode() {
     if let discountData = viewModel.discountResult {
        lblDiscountAmount.text = String(describing: discountData.discountAmount)
        lblFinalAmount.text = String(describing: discountData.payAmount)
        lblTax.text = String(describing: discountData.tax)
        }
    }
    
    func didSelectSubmitBtn() {
        let loginVc = Storyboards.auth.instantiateViewController(withIdentifier: "loginVC") as! LoginVC
        let navController = MyNav(rootViewController: loginVc,
                                  patternNavBar: false)
        present(navController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        getPayInvoice()
    }
    
    func setupViews() {
        if let invoiceResult = viewModel.invoice {
        lblPackageAmount.text = String(describing: invoiceResult.packageAmount)
        lblFinalAmount.text = String(describing: invoiceResult.payAmount)
        lblTax.text = String(describing: invoiceResult.tax)
        lblDescription.text = invoiceResult.discription
            
        }
    }
    
    func getPayInvoice() {
        showLoading()
        viewModel.requestToGetRegisterInvoice(successToGetRegisterInvoice, onFailure: failure)
    }
    
    func successToGetPecToken() {
        hideLoading()
    }
    
    func successToGetRegisterInvoice() {
        hideLoading()
        setupViews()
        viewModel.requestToGetPecToken(viewModel.invoice?.invoiceID ?? 0, onSuccess: successToGetPecToken, onFailure: failure)
    }
    @IBAction func btnGotoBankPressed(_ sender: Any) {
        pay()
    }
    @IBAction func btnCanclePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func pay() {
        initpayment.registerPay(merchant : self)
            self.initpayment.initPay(Token: (self.viewModel.resultToken?.pecToken) ?? " " , MerchantVCArg: self, TSPEnabled: self.viewModel.resultToken?.orderID ?? 0)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch: UITouch? = touches.first as? UITouch
        //location is relative to the current view
        // do something with the touched point
        if touch?.view != vwMain {
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    func successToInquiryPayment() {
        hideLoading()
        StoringData.isUserRegisterCapp = true
        let dialogVc = Storyboards.main.instantiateViewController(withIdentifier: "dialogVc") as! DialogVC
        dialogVc.configure( paymentMsg, delagate: self)
        present(dialogVc, animated: true, completion: nil)

    }
    
}

extension VerifyToPaymentVC: MerchantResultObserver {
    func update(encData: String, message: String, status: Int) {
        self.paymentMsg = message
        switch status {
        case 0:
            showLoading()
            viewModel.requestToInquiryPayment(successToInquiryPayment, onFailure: failure)
        default:
            break
        }
        
        

        print(encData)
    }
    
    func error(errorType: Int, orderID: Int) {
        print(errorType)
     //   
    }
    
    
}
