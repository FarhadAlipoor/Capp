//
//  RecoveryPasswordBySmsVC.swift
//  Capp
//
//  Created by tannaz on 12/15/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit

class RecoveryPasswordBySmsVC: MyVC {
    
    let viewmModel = RecoveryPasswordBySmsVM()
    @IBOutlet weak var tfCode: MyTextField!
    @IBOutlet weak var lblCountTime: MyLabel!
    @IBOutlet weak var btnResend: MyButton!
    
        var delayBeforeSendingAgaing : Int32? = 120
    private (set) var amountOfTouches: Int = 0 {
        didSet {
            if self.amountOfTouches >= 3 {
                btnResend.isEnabled = false
                btnResend.isUserInteractionEnabled = false
            }
        }
    }
    override func viewDidLoad() {
        requestToRecoveryPassBySMS()
        updateCountDown()
        title = "InpuySendingCode".text
    }
    
    func requestToRecoveryPassBySMS() {
        showLoading()
        viewmModel.requestToRecoverPassBySMS(StoringData.driverNo ?? 0 , onSuccess: successToSendRecoveryCode, onFailure: failure)
    }
    
    func successToSendRecoveryCode() {
        hideLoading()
    }
    
    @IBAction func btnResendPressed(_ sender: Any) {
        self.amountOfTouches += 1
        requestToRecoveryPassBySMS()
    }
  
    @IBAction func btnSubmitPressed(_ sender: Any) {
        viewmModel.requestToCheckRecoveryBySMS(StoringData.driverNo ?? 0 , code: tfCode.text ?? "", onSuccess: checkRecoveryCodeSuccessfull, onFailure: failure)
    }
    
    func checkRecoveryCodeSuccessfull() {
        let changePasswordVC = Storyboards.auth.instantiateViewController(withIdentifier: "changePasswordVC") as! ChangePasswordVC
        navigationController?.pushViewController(changePasswordVC, animated: true)
    }
    
    @objc func updateCountDown() {
        self.delayBeforeSendingAgaing! -= 1
        if self.delayBeforeSendingAgaing! > -1 {
            let remainingSeconds: Int = Int(self.delayBeforeSendingAgaing!%60)
            let remainingMiuntes : Int = Int(self.delayBeforeSendingAgaing!/60)
            lblCountTime.text = " \(remainingMiuntes.persianTimeDigits()):\(remainingSeconds.persianTimeDigits())"
            self.perform(#selector(MobileVerificationVC.updateCountDown), with: nil, afterDelay: 1.0)
        } else {
            btnResend.isEnabled = true
        }
    }
}
