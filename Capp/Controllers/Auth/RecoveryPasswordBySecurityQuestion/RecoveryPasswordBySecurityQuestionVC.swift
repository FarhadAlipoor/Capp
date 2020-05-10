//
//  RecoveryPasswordBySecurityQuestionVC.swift
//  Capp
//
//  Created by tannaz on 12/15/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit

class RecoveryPasswordBySecurityQuestionVC: MyVC {
    
    let viewModel = RecoveryPasswordBySecurityQuestionVM()
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var tfAnswer: MyTextField!
    
    @IBAction func btnSubmitPressed(_ sender: Any) {
        requestToCheckRecoverPass()
    }
    
    override func viewDidLoad() {
        title = "RecoveryPassword".text
    }
    override func viewDidAppear(_ animated: Bool) {
        requestToRecoverPass()
    }
    
    func requestToRecoverPass() {
        showLoading()
        viewModel.requestToRecoverPassBySecurityQuest(StoringData.driverNo ?? 0, onSuccess: getSecQuestionSuccessfull, onFailure: failure)
    }
    
    func getSecQuestionSuccessfull() {
        hideLoading()
        lblQuestion.text = Globals.shared.securityQuestions[viewModel.questionID! - 1]
        
    }
    
    func requestToCheckRecoverPass() {
        viewModel.requestToCheckRecoverPassBySecQuestion(StoringData.driverNo ?? 0, answer: tfAnswer.text ?? "", onSuccess: checkRecoverySuccessful, onFailure: failure)
    }
    
    func checkRecoverySuccessful() {
        let changePasswordVC = Storyboards.auth.instantiateViewController(withIdentifier: "changePasswordVC") as! ChangePasswordVC
        navigationController?.pushViewController(changePasswordVC, animated: true)
    }
}
