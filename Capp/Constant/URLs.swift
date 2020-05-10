//
//  URLs.swift
//  Capp
//
//  Created by tannaz on 11/29/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import Foundation

struct URLs {
    
    static func site() -> String {
        return "http://capp.ir/service/"
    }
    
    static let baseURL                      = "\(URLs.site())api/"
    static let inquiryDriver                = "\(baseURL)Inquiry/Driver"
    static let securityQuestion             = "\(baseURL)Account/GetSecurityQuestions"
    static let register                     = "\(baseURL)Account/Register"
    static let login                        = "\(baseURL)Account/Login"
    static let logout                       = "\(baseURL)Account/Logout"
    static let registerCode                 = "\(baseURL)Account/ReqVerificationCode"
    static let checkVerificationCode        = "\(baseURL)Account/CheckVerificationCode"
    static let changePhoneNom               = "\(baseURL)Account/ChangePhoneNo"
    static let reqChangePassword            = "\(baseURL)Account/ReqChangePass"
    static let changePassbySMS              = "\(baseURL)Account/ReqChangePassBySMS"
    static let checkRecoverPassSMS          = "\(baseURL)Account/CheckRecoverPassSMS"
    static let recoverPassBySecQuestion     = "\(baseURL)Account/ReqRecoverPassBySecQuestion"
    static let checkRecoverPassSecAnswer    = "\(baseURL)Account/CheckRecoverPassSecAnswer"
    static let changePassword               = "\(baseURL)Account/ChangePass"
    static let getProfileInfo               = "\(baseURL)Account/Profile"
    static let feedback                     = "\(baseURL)FeedBack/FeedBack"
    static let getInviteCode                = "\(baseURL)Account/GetInviteCode"

    //Vahicle
    static let getAllVehiclesForMember      = "\(baseURL)Vehicle/GetAllVehiclesForMember"
    static let getAllTrrailerVehicle        = "\(baseURL)Vehicle/GetAllTrrailerVehicle"
    static let updateVehicle                = "\(baseURL)Vehicle/Update"
    static let inquiryVehicle               = "\(baseURL)Inquiry/Vehicle"
    static let submitVehicle                = "\(baseURL)Vehicle/Submit"
    //Terminal
    static let getTerminals                 = "\(baseURL)TerminalInfo/GetTerminals"
    static let getTerminalMenuItems         = "\(baseURL)TerminalInfo/GetMenusByTerminal"
    static let getDriverTurn                = "\(baseURL)Turn/GetTurn"
    static let getVTSTurn                   = "\(baseURL)Turn/VTS"
    static let invalidTurn                  = "\(baseURL)Turn/TurnInvalidate"
    //Permit
    static let getPermit                    = "\(baseURL)Permit/GetPermit"
    static let getCargoVps                  = "\(baseURL)Permit/GetCargoVPS"
    static let addPermit                    = "\(baseURL)Permit/VPS"
    static let invalidPermit                = "\(baseURL)Permit/VPSInvalidate"
    static let getDriverPermit              = "\(baseURL)Report/GetDriverPermit"
    
    //saloon
    static let getCargoSaloon               = "\(baseURL)Saloon/GetCargoSaloon"
    
    //Payments
    static let getPayRegisterInvoice           = "\(baseURL)Payment/GetRegisterInvoice"
    static let getPayPackageType               = "\(baseURL)Payment/GetPackageType"
    static let getPayPackage                   = "\(baseURL)Payment/GetPackage"
    static let getPayInvoice                   = "\(baseURL)Payment/GetInvoice"
    static let checkDiscountCode               = "\(baseURL)Payment/CheckDiscountCode"
    static let getPayPecToken                  = "\(baseURL)Payment/GetPecToken"
    static let inquiryPay                      = "\(baseURL)Payment/Inquiry"
    static let getSaleTokenNew                  = "https://Mpl.Pec.ir/api/EShop/GetSaleTokenNew"

    
    //Reports
    static let turnReports                  = "\(baseURL)Report/GetDriverTurn"
    static let permitReports                = "\(baseURL)Report/GetDriverPermit"
    static let creditReports                = "\(baseURL)Report/GetDriverCredit"
    static let paymentReports               = "\(baseURL)Report/GetPayment"
    
    
    
    
    
    
    
    
}
