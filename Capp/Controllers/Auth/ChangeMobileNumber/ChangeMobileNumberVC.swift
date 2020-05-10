//
//  ChangeMobileNumberVC.swift
//  Capp
//
//  Created by tannaz on 12/14/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit

class ChangeMobileNumberVC: MyVC {
     let viewModel = ChangeMobileNumberVM()
    
    @IBOutlet weak var tfNewPhoneNom: MyTextField!
    
    override func viewDidLoad() {
        title = "ChangePhoneNumber".text
    }
    @IBAction func btnSubmitPressed(_ sender: Any) {
        showLoading()
        viewModel.requestToChangePhoneNumber(StoringData.driverNo ?? 0, mobileNom: (tfNewPhoneNom.text?.toInt()) ?? 0, onSuccess: changePhoneNomSuccessfull, onFailure: failure)
    }
    
    override func failure(_ response: JResponse?) {
        hideLoading()
        super.failure(response)
        tfNewPhoneNom.text = ""
    }
    func changePhoneNomSuccessfull() {
        viewModel.requestToSendMobileVerificationCode(StoringData.driverNo ?? 0, onSuccess: sendVerifyCodeSuccess, onFailure: failure)
    }
    
    func sendVerifyCodeSuccess() {
        navigationController?.popViewController(animated: true)

    }
}
