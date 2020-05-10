//
//  MySecurityQuestion.swift
//  Capp
//
//  Created by tannaz on 12/15/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit
class MySecurityQuestion {
    
    var id: Int = -1
    var question: String = ""
    let securityQuestions: [String] = ["WhereIsYourAddress?".text , "WhoIsYourBestFriend?".text,"WhatsTheNameOfYourSchool?".text, "WhatsTheNameOfYourCompany?".text,"WhatsYourFavoriteColor?".text ,
                                       "WhatsTheNameOfYourChild?".text]
    
    init(id: Int, question: String) {
        self.id         = id
        self.question   = question
    }
}
