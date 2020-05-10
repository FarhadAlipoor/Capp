//
//  JInvitedCode.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/26/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JInvitedCode: ArrowParsable {
    
    var inviteCode                   = String()
    
    mutating func deserialize(_ json: JSON) {
        inviteCode                       <-- json["InviteCode"]
    }
}
