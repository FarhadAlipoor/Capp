//
//  RegisterVC.swift
//  Capp
//
//  Created by tannaz on 12/3/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit
import IQKeyboardManager

class RegisterVC: MyVC , isAbleToReceiveQuestion {
    
    @IBOutlet weak var vwCheckbox: UIView!
    @IBOutlet weak var tfMobile: MyTextField!
    @IBOutlet weak var tfPassword: MyTextField!
    @IBOutlet weak var tfRepeatPassword: MyTextField!
    @IBOutlet weak var tfSecurityQuestion: MyTextField!
    @IBOutlet weak var tfAnswerQuestion: MyTextField!
    
    let viewModel = RegisterVM()
    var isChecked = false
    
    let securityQuestions: [String] = ["WhereIsYourAddress?".text , "WhoIsYourBestFriend?".text,"WhatsTheNameOfYourSchool?".text, "WhatsTheNameOfYourCompany?".text,"WhatsYourFavoriteColor?".text ,
                                       "WhatsTheNameOfYourChild?".text]
    override func viewDidLoad() {
        
        tfPassword.isSecureTextEntry = true
        tfRepeatPassword.isSecureTextEntry = true
        title = "InputData".text
        StoringData.sequrityQuestion = securityQuestions
    }
    
    func customize() {
        // pattern navBar background
        navigationController?.navigationBar.barTintColor = CappColors.darkBlue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false

        // fonts
        var font: UIFont!
        font = Fonts.bold(withSize: 16)
        
        navigationController?.navigationBar.titleTextAttributes =
            [
                NSAttributedStringKey.font: font,
                NSAttributedStringKey.foregroundColor: UIColor.white
            ] as [NSAttributedStringKey : Any]
    }
    
    func questionSelected(_ question: MySecurityQuestion) {
        viewModel.selectedQuestion = question
        tfSecurityQuestion.text = question.question
        // tfSecurityQuestion.isUserInteractionEnabled = false
    }
    
    @IBAction func cheboxPressed(_ sender: UIButton) {
        isChecked = !isChecked
        if isChecked {
            sender.titleLabel?.font = UIFont(name: "CAPP", size: 14)
            sender.setTitle("*", for: .normal)
        } else {
            sender.setTitle("&", for: .normal)
        }
    }
    
    @IBAction func cappRulesPressed(_ sender: Any) {
        
        let cappRulesVC = Storyboards.auth.instantiateViewController(withIdentifier: "cappRulesVC") as! CappRulesPopup
        cappRulesVC.modalPresentationStyle = .overCurrentContext
        present(cappRulesVC, animated: true, completion: nil)
    }
    
    @IBAction func getVerifyCodePressed(_ sender: Any) {
        if !(tfMobile.text?.isValidMobileNumber())! {
            tfMobile.errorText = "شماره موبایل وارد شده معتبر نیست"
            tfMobile.showError()

            }
        if (tfMobile.text?.isEmpty)! {
            tfMobile.showErrorWithText(errorText: "شماره تلفن همراه خود را وارد کنید")
            tfMobile.showError()

        }
        if !isChecked {
            vwCheckbox.shake()
        }
        
        if !(tfMobile.text?.isEmpty)! && !(tfPassword.text?.isEmpty)! && !(tfRepeatPassword.text?.isEmpty)! && !(tfSecurityQuestion.text?.isEmpty)! && !(tfAnswerQuestion.text?.isEmpty)! && isChecked {
            showLoading()
            viewModel.requestToRegisterDriver(StoringData.driverNo!, nationalCode: StoringData.nationalCode!, pass: tfPassword.text!, sequrityQuesID: 1, securityAnswer: tfAnswerQuestion.text!, driverMobileNom: tfMobile.text!.toInt(), onSuccess: successToRegister , onFailure: failure)
        } else {
            if (tfPassword.text?.isEmpty)! {
                tfPassword.showErrorWithText(errorText: "لطفا رمز عبور خود را وارد کنید")
                
            }
            if (tfRepeatPassword.text?.isEmpty)! {
                tfRepeatPassword.showErrorWithText(errorText: "لطفا تکرار رمز عبور خود را وارد کنید ")
            }
            if (tfSecurityQuestion.text?.isEmpty)! {
                tfSecurityQuestion.showErrorWithText(errorText: "لطفا سوال امنیتی خود را انتخاب کنید")
                tfSecurityQuestion.showError()
            }
            if (tfAnswerQuestion.text?.isEmpty)! {
                tfAnswerQuestion.showErrorWithText(errorText: "لطفا جواب سوال امنیتی خود را وارد کنید")
                tfAnswerQuestion.showError()
            }
            actShowSnackbar("لطفا تمامی مقادیر را وارد کنید", actionTitle: "Done".text)
        }
        
        IQKeyboardManager.shared().resignFirstResponder()
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        
    }
    
    override func failure(_ response: JResponse?) {
        super.failure(response)
        
        tfSecurityQuestion.isEnabled = true
        
    }
    
    func successToRegister() {
        hideLoading()
        let mobileVerificationVC = Storyboards.auth.instantiateViewController(withIdentifier: "mobileVerificationVC") as! MobileVerificationVC
        mobileVerificationVC.configure(tfMobile.text!.toInt(), driverNom: StoringData.driverNo!)
        navigationController?.pushViewController(mobileVerificationVC, animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfMobile {
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 11
        }
        if textField == tfSecurityQuestion {
            return false
        } else {
            return true
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == tfSecurityQuestion {
            
            let pickerView = Storyboards.auth.instantiateViewController(withIdentifier: "mypickerView") as! MyPickerview
            pickerView.configure(securityQuestions, delegate: self)
            pickerView.modalPresentationStyle = .overCurrentContext
            present(pickerView, animated: true, completion: nil)
            return false
        }
        return true
    }
}
