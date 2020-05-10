//
//  LoginVC.swift
//  Capp
//
//  Created by tannaz on 11/19/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit

class LoginVC: MyVC {
    
    @IBOutlet weak var tfIdentifier: MyTextField!
    @IBOutlet weak var tfPassword: MyTextField!
    @IBOutlet weak var btnForgotPassword: MyButton!
    
    @IBOutlet weak var btnRegister: MyButton!
    let limitLength = 7
    let viewModel = LoginVM()
    let securityQuestions: [String] = ["WhereIsYourAddress?".text , "WhoIsYourBestFriend?".text,"WhatsTheNameOfYourSchool?".text, "WhatsTheNameOfYourCompany?".text,"WhatsYourFavoriteColor?".text ,
                                       "WhatsTheNameOfYourChild?".text]
    override func viewDidLoad() {
        StoringData.setTrialerType()
        Globals.shared.securityQuestions = securityQuestions
        setupbuttons()
        setupViews()
    }
    
    func setupViews() {
        tfPassword.isSecureTextEntry = true
        title = "LoginVC".text
        
    }
    
    func requestToGetAllVehicle() {
        showLoading()
        viewModel.getAllVehicle(onSuccess: successToGetAllVehicle, onFailure: failure)
    }
    
    func successToGetAllVehicle() {
        if let items = viewModel.items {
            if items.count > 0 {
                let chooseServiceType = Storyboards.main.instantiateViewController(withIdentifier: "chooseServiceTypeVc") as! ChooseServiceTypeVC
                let navController = MyNav(rootViewController: chooseServiceType,
                                          patternNavBar: false)
                present(navController, animated: true, completion: nil)
            }
        }
    }
    
    func setupbuttons() {
        let underlinettributes : [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.font : Fonts.font(withSize: 19),
            NSAttributedStringKey.foregroundColor : CappColors.darkBlue,
            NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue]
        
        let forgotAttributeString = NSMutableAttributedString(string: "ForgotYourPassword".text,
                                                              attributes: underlinettributes)
        let registerAttributeString = NSMutableAttributedString(string: "RegisterInSystem".text, attributes: underlinettributes)
        btnForgotPassword.setAttributedTitle(forgotAttributeString, for: .normal)
        btnRegister.setAttributedTitle(registerAttributeString, for: .normal)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        if (tfIdentifier.text?.isEmpty)! && !(tfPassword.text?.isEmpty)!{
            tfIdentifier.errorText = "شماره کارت هوشمند خود را وارد کنید"
            tfIdentifier.showError()
        }
        if (tfPassword.text?.isEmpty)! && !(tfIdentifier.text?.isEmpty)! {
            tfPassword.errorText = "رمز عبور خود را وارد کنید"
            tfPassword.showError()
        }
        if !(tfIdentifier.text?.isEmpty)! && !(tfPassword.text?.isEmpty)! {
            showLoading()
            viewModel.requestToLoginDriver((tfIdentifier.text?.toInt())!, password: tfPassword.text!, onSuccess: loginSuccessfull, onFailure: failure)
            
        } else {
            tfPassword.errorText = "رمز عبور خود را وارد کنید"
            tfPassword.showError()
            tfIdentifier.errorText = "شماره کارت هوشمند خود را وارد کنید"
            tfIdentifier.showError()
        }
        
        
    }
    override func failure(_ response: JResponse?) {
        super.failure(response)
        
        if let code = response?.code {
            if code == -5 {
                let mobileVerificationVC = Storyboards.auth.instantiateViewController(withIdentifier: "mobileVerificationVC") as! MobileVerificationVC
                mobileVerificationVC.configure((StoringData.user?.mobileNom)!, driverNom: (tfIdentifier.text?.toInt())!)
                tfIdentifier.text = ""
                tfPassword.text = ""
                navigationController?.pushViewController(mobileVerificationVC, animated: true)
            }
        }
        
    }
    
    func loginSuccessfull() {
        
        viewModel.requestToGetProfileInfo(onSuccess: successToGetProfileInfo , onFailure: failure)
    }
    
    func successToGetProfileInfo() {
        requestToGetAllVehicle()
//        let vehicleList = Storyboards.main.instantiateViewController(withIdentifier: "vahicleListVC") as! VahicleListVC
//        navigationController?.pushViewController(vehicleList, animated: true)
    }
    
    @IBAction func registerInSystemPressed(_ sender: Any) {
        
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
        
        let driverInquiry = Storyboards.auth.instantiateViewController(withIdentifier: "driverInquiryVC") as! DriverInquiryVC
        navigationController?.pushViewController(driverInquiry, animated: true)
    }
    
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        
        let recoveryPassVC = Storyboards.auth.instantiateViewController(withIdentifier: "recoveryPasswordTypeVC") as! RecoveryPasswordTypeVC
        navigationController?.pushViewController(recoveryPassVC, animated: true)
    }
    
    func success() {
        print("Yess")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == tfIdentifier {
            
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= limitLength
        } else {
            return true
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == tfPassword {
            tfPassword.hideError()
        } else if textField == tfIdentifier {
            tfIdentifier.hideError()
        }
    }
}

