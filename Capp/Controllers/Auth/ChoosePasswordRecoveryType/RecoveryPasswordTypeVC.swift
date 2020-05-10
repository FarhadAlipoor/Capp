//
//  RecoveryPasswordTypeVC.swift
//  Capp
//
//  Created by tannaz on 12/8/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit

class RecoveryPasswordTypeVC: MyVC , SSRadioButtonControllerDelegate {
    
    func didSelectButton(selectedButton: UIButton?, index: Int) {
        if radioButtonController?.selectedButton() == btnRecoverBySms {
            recoveryMode = .bySms
        } else {
            recoveryMode = .byQuestion
        }
        
    }
    
    let viewModel = RecoveryPasswordTypeVM()
    let limitLength = 7
    enum RecoveryMode: String {
        case bySms = "SMS"
        case byQuestion = "Question"
    }
    
    @IBOutlet weak var tfDriverCardNo: MyTextField!
    @IBOutlet weak var btnRecoverBySms: MyRadioButton!
    @IBOutlet weak var btnRecoverBtQuest: MyRadioButton!
    var radioButtonController: MyRadioButtonController?
    var recoveryMode: RecoveryMode = .bySms
    
    override func viewDidLoad() {
        radioButtonController = MyRadioButtonController(buttons: btnRecoverBySms , btnRecoverBtQuest)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true
        title = "RecoveryPassword".text
    }
    
    @IBAction func btnSubmitPressed(_ sender: Any) {
        showLoading()
        viewModel.requestToRecoveryPassword(tfDriverCardNo.text!.toInt(), onSuccess: requestToChangePasswordSuccessfull, onFailure: failure)
    }
    
    func requestToChangePasswordSuccessfull() {
        hideLoading()
        switch recoveryMode.rawValue {
        case "Question":
            let recoveryBySecurityQues = Storyboards.auth.instantiateViewController(withIdentifier: "recoveryPasswordBySecurityQuestionVC") as! RecoveryPasswordBySecurityQuestionVC
            navigationController?.pushViewController(recoveryBySecurityQues, animated: true)
            break
        case "SMS":
            let recoveryPasswordBySms = Storyboards.auth.instantiateViewController(withIdentifier: "recoveryPasswordBySmsVC") as! RecoveryPasswordBySmsVC
            navigationController?.pushViewController(recoveryPasswordBySms, animated: true)
            break
            
        default:
            break
        }
    }
    
    func didSelectButton(selectedButton: UIButton?) {
        if radioButtonController?.selectedButton() == btnRecoverBySms {
            recoveryMode = .bySms
        } else {
            recoveryMode = .byQuestion
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfDriverCardNo {
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= limitLength
        } else {
            return true
        }
    }
}

