//
//  RecoveryPasswordBySecurityQuestionVM.swift
//  Capp
//
//  Created by tannaz on 12/15/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

class RecoveryPasswordBySecurityQuestionVM: MyVM {
    
    var questionID: Int? = nil
    func requestToRecoverPassBySecurityQuest(_ driverCard: Int, onSuccess: @escaping () -> Void, onFailure: @escaping WebServices.Failure) {
        WebServices.requestToChangePasswordbySecurityQuestion(driverCard, success: { (response) in
            if let question = (response?.result as? JResSecurityQuestion) {
                self.questionID = question.id
            onSuccess()
            }
         }, failure: onFailure)
    }
    
    func requestToCheckRecoverPassBySecQuestion(_ driverCard: Int , answer: String  , onSuccess: @escaping () -> Void, onFailure: @escaping WebServices.Failure) {
        WebServices.checkRecoverPassSecQuestion(driverCard, answer: answer, success: { (response) in
                onSuccess()
            
         }, failure: onFailure)
    }
}
