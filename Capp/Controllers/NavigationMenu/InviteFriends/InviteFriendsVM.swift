//
//  InviteFriendsVM.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/25/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
class InviteFriendsVM: MyVM {
    
    var inviteCode: String? = ""
        func requestToGetInviteCode(onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getInviteCode(  { (response) in
            if let code = (response?.result as? JInvitedCode)?.inviteCode {
                self.inviteCode = code
            onSuccess()
            }
            
        }, failure: onFailure)
    }
}
