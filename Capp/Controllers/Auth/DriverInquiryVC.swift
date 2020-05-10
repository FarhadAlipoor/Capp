//
//  DriverInquiryVC.swift
//  Capp
//
//  Created by tannaz on 11/21/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit
import IQKeyboardManager

class DriverInquiryVC: MyVC {
    
    let viewModel = DriverInquiryVM()
    let limitLength = 7
    @IBOutlet weak var tfDriverCardNo: MyTextField!
    @IBOutlet weak var tfNationalCode: MyTextField!
    
    
    override func viewDidLoad() {
        title = "InquiryDriver".text
    }
    @IBAction func inquiryDriverPressed(_ sender: Any) {
        IQKeyboardManager.shared().resignFirstResponder()
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        if !(tfDriverCardNo.text?.isEmpty)! && !(tfNationalCode.text?.isEmpty)! {
            showLoading()
            viewModel.requestToInquiryDriver(tfDriverCardNo.text!.toInt(), nationalCode: tfNationalCode.text!, onSuccess: inquiryDriverSuccessfull, onFailure: failure)
        } else {
            actShowSnackbar("شماره کارت هوشمند و کد ملی خود را وارد کنید", actionTitle: "Done".text)
            
        }
        
    }
    
    override func failure(_ response: JResponse?) { // TODO:: Which request?!
        super.failure(response)
        tfDriverCardNo.text = ""
        tfNationalCode.text = ""
        
    }

    func inquiryDriverSuccessfull() {
        hideLoading()
        let itemSelectionVC = Storyboards.auth.instantiateViewController(withIdentifier: "verifyDriverVC") as! VerifyDriverVC
        itemSelectionVC.driver = viewModel.driver
        itemSelectionVC.modalTransitionStyle = .coverVertical
        itemSelectionVC.modalPresentationStyle = .overCurrentContext
        present(itemSelectionVC, animated: true, completion: nil)
        
//        let navController = MyNav(rootViewController: itemSelectionVC,
//                             patternNavBar: false)
//        present(navController, animated: true, completion: nil)
        //present(itemS electionVC, animated: true, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfDriverCardNo {
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= limitLength
        }
        if textField == tfNationalCode {
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 10
        }else {
            return true
        }
    }
    
}


