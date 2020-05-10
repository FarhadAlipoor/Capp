//
//  DriverInquiryVM.swift
//  Capp
//
//  Created by tannaz on 11/21/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
class DriverInquiryVM : MyVM {
    
    var driver : JResDriver? = nil
    var message: String? = nil
    var res : JResponse? = nil
    func requestToInquiryDriver(_ driverNom: Int, nationalCode: String , onSuccess: @escaping () -> Void , onFailure: @escaping WebServices.Failure) {
        WebServices.inquiryDriver(driverNom, nationalCode: nationalCode, success: { (response) in

            if let driver = (response?.result as? JResDriver) {
                self.driver = driver
                StoringData.nationalCode = self.driver?.nationalCode
                StoringData.driverNo = self.driver?.cardNo
                StoringData.user = driver
                onSuccess()
            }
            
        }, failure: onFailure)
    }

}
