//
//  SelectableItemsVM.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

class SelectableItemsVM: MyVM {
    
    enum Mode: String {
        case trailersType       = "trailersType"
        case terminals          = "terminals"
        case feedback           = "feedback"
        
    }
    
    var mode: Mode = .trailersType
    var terminals: [JTerminalResponse]? = nil
    var menuItems: [JTerminalMenu]? = nil
    
    func requestToGetTerminalMenuItem(_ terminaleID: Int , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure ) {
        WebServices.getAllTerminalMenuItems(terminaleID, success:  { (response) in
            if let terminalMenuItems = (response?.result as? JResTerminalMenu)?.terminalMenu {
                self.menuItems = terminalMenuItems
                onSuccess()
            }
        }, failure: onFailure)
    }
    
}

