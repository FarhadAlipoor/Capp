//
//  RegisterVM.swift
//  Capp
//
//  Created by tannaz on 12/3/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

class RegisterVM: MyVM {
    
    var questions: [JResSecurityQuestion]? = nil
    var selectedQuestion: MySecurityQuestion? = nil

    func requestToGetSecurityQuestions(_ onSuccess: @escaping () -> Void  , onFailure: @escaping WebServices.Failure ) {
        WebServices.getSecurityQuestions({ (response) in
          //  if let question = (response? as? JResSecurityQuestion) {
               // StoringData.sequrityQuestions = addresses
           // self.questions?.append(questions)
                onSuccess()
          //  }
        }, failure: onFailure)
    }
    
    func requestToRegisterDriver( _ driverNum: Int , nationalCode: String , pass: String , sequrityQuesID: Int , securityAnswer: String , driverMobileNom: Int , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure ) {
        WebServices.registerDriver(driverNum, nationalCode: nationalCode, passwor: pass, sequrityQuestionID: sequrityQuesID, securityAnswer: securityAnswer, PhoneNo: driverMobileNom, success: { (response) in
            //  if let question = (response? as? JResSecurityQuestion) {
            // StoringData.sequrityQuestions = addresses
            // self.questions?.append(questions)
            onSuccess()
            //  }
        }, failure: onFailure)
        
    }
    
}
