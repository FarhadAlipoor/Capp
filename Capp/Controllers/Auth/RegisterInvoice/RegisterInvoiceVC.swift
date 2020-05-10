//
//  RegisterInvoiceVC.swift
//  Capp
//
//  Created by tannaz on 4/12/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit
import PecPayment

class RegisterInvoiceVC: MyVC , DialogDelegate{
    
    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var lblPurchasedPackage: UILabel!
    @IBOutlet weak var lblPackageAmount: UILabel!
    @IBOutlet weak var lblPackageTax: UILabel!
    @IBOutlet weak var lblDiscroption: UILabel!
    @IBOutlet weak var lblAmountPayable: UILabel!
    @IBOutlet weak var btnCancel: MyButton!
    @IBOutlet weak var btnPayment: MyButton!
    
    
    let viewModel = RegisterInvoiceVM()
    var initpayment = InitPayment()
    var paymentMsg = String()

    func configure(_ payPackage: [JPayPackage]) {
        viewModel.selectedPackageInfo = payPackage[0]
    }
    
    override func viewDidLoad() {
        getPayInvoice()

    }
    
    func setupViews() {
        if let invoiceResult = viewModel.invoice {
            lblPackageAmount.text = invoiceResult.packageAmount.rial()
            lblAmountPayable.text = invoiceResult.payAmount.rial()
            lblPackageTax.text = invoiceResult.tax.rial()
            lblDiscroption.text = invoiceResult.discription
            
            
        }
    }
    
    func didSelectSubmitBtn() {
        let loginVc = Storyboards.auth.instantiateViewController(withIdentifier: "loginVC") as! LoginVC
        let navController = MyNav(rootViewController: loginVc,
                                  patternNavBar: false)
        present(navController, animated: true, completion: nil)
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
    
    func pay() {
        initpayment.registerPay(merchant : self)
        self.initpayment.initPay(Token: (self.viewModel.resultToken?.pecToken) ?? " " , MerchantVCArg: self, TSPEnabled: self.viewModel.resultToken?.orderID ?? 0)
        
    }
    
    func successToInquiryPayment() {
        
        hideLoading()
        StoringData.isUserRegisterCapp = true
        let dialogVc = Storyboards.main.instantiateViewController(withIdentifier: "dialogVc") as! DialogVC
        dialogVc.configure( paymentMsg, delagate: self)
        present(dialogVc, animated: true, completion: nil)
//        hideLoading()
//        StoringData.isUserRegisterCapp = true
//        let vehicleList = Storyboards.main.instantiateViewController(withIdentifier: "vahicleListVC") as! VahicleListVC
//        let navController = MyNav(rootViewController: vehicleList,
//                                  patternNavBar: false)
//        present(navController, animated: true, completion: nil)
    }
    

     @IBAction func payPressed(_ sender: Any) {
        pay()
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismissMe()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch: UITouch? = touches.first as? UITouch
        //location is relative to the current view
        // do something with the touched point
        if touch?.view != vwMain {
            dismiss(animated: true, completion: nil)
        }
    }
}

extension RegisterInvoiceVC: MerchantResultObserver {
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



