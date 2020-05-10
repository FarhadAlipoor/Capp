//
//  ChooseServiceTypeVM.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

class ChooseServiceTypeVM: MyVM {
    var terminals: [JTerminalResponse]? = nil
    func requestToGetAllTerminals(onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.getAllTerminals(success:   { (response) in
            if let allTerminals = (response?.result as? JResTerminals)?.terminals{
                StoringData.terminals = self.terminals
                self.terminals = allTerminals
                Globals.shared.terminals = self.terminals!
                onSuccess()
            }
        }, failure: onFailure)
    }
    
}
