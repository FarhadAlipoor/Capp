//
//  CommentsVM.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/24/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

class CommentsVM:MyVM {
    
    func reqToSendFeedback(_ title: String , feedbackType: Int , message: String , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.sendFeedback(title, feedbackType: feedbackType, message: message, success: { (response) in
            onSuccess()
            
        }, failure: onFailure)
    }
}
