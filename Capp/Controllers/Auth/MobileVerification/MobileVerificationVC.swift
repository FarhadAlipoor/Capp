//
//  MobileVerificationVC.swift
//  Capp
//
//  Created by tannaz on 12/8/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit

class MobileVerificationVC: MyVC {
    
    let viewModel = MobileVerificationVM()
    
    func configure(_ mobileNum: Int , driverNom: Int) {
        viewModel.mobileNumber = mobileNum
        viewModel.driverCardNumber = driverNom
    }
    
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var btnChangeMobileNom: MyButton!
    @IBOutlet weak var tfVerificationCode: MyTextField!
    @IBOutlet weak var lblTimerCount: MyLabel!
    @IBOutlet weak var btnResendCode: MyButton!
    
    var delayBeforeSendingAgaing : Int32? = 120
    
    private (set) var amountOfTouches: Int = 0 {
        didSet {
            if self.amountOfTouches >= 3 {
                btnResendCode.isEnabled = false
                btnResendCode.isUserInteractionEnabled = false
            }
        }
    }
    override func viewDidLoad() {
        requestToGetCode()
        updateCountDown()
        
        lblMobile.text = String(describing: viewModel.mobileNumber)

    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    func requestToGetCode() {
        showLoading()
        viewModel.requestToSendMobileVerificationCode(viewModel.driverCardNumber!, onSuccess: sendVerifyCodeSuccess, onFailure: failure)
    }
    
    func sendVerifyCodeSuccess() {
        hideLoading()
        
    }
    
    
    @IBAction func btnChangeMobilePressed(_ sender: Any) {
        let changeMobileNumberVC = Storyboards.auth.instantiateViewController(withIdentifier: "changeMobileNumberVC") as! ChangeMobileNumberVC
        navigationController?.pushViewController(changeMobileNumberVC, animated: true)
    }
    @IBAction func btnResendCodePressed(_ sender: Any) {
        self.amountOfTouches += 1
        requestToGetCode()

    }
    @IBAction func btnSubmitPressed(_ sender: Any) {
        showLoading()
        viewModel.requestToCheckVerificationCode(viewModel.driverCardNumber!, code: tfVerificationCode.text!, onSuccess: checkVerifyCodeSuccessfull , onFailure: failure)
    }
    
    func checkVerifyCodeSuccessfull() {
        hideLoading()
        let loginVc = Storyboards.auth.instantiateViewController(withIdentifier: "loginVC") as! LoginVC
        navigationController?.pushViewController(loginVc, animated: true)
    }
    
    @objc func updateCountDown() {
        self.delayBeforeSendingAgaing! -= 1
        if self.delayBeforeSendingAgaing! > -1 {
            let remainingSeconds: Int = Int(self.delayBeforeSendingAgaing!%60)
            let remainingMiuntes : Int = Int(self.delayBeforeSendingAgaing!/60)
            lblTimerCount.text = " \(remainingMiuntes.persianTimeDigits()):\(remainingSeconds.persianTimeDigits())"
            self.perform(#selector(MobileVerificationVC.updateCountDown), with: nil, afterDelay: 1.0)
        } else {
            btnResendCode.isEnabled = true
        }
    }
}
