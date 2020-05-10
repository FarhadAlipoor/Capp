//
//  MyStatusCode.swift
//  Capp
//
//  Created by tannaz on 11/29/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

enum MyStatusCode: Int {
    
    case noResponse = -2
    case socketDown = -1
    case connectionError = 0
    case normal = 200
    case serverDown = 500
    
    // TODO:: TEXTS
    
    var message: String {
        get {
            switch self {
            case .noResponse:
                return "ErrorNoResponse".text
            case .socketDown:
                return "SocketDown".text
            case .connectionError:
                return "NotConnectedToInternet".text
            case .normal:
                return ""
            case .serverDown:
                return "ServerDown".text
            }
        }
    }
    
}
