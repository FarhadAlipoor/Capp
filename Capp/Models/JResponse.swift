//
//  JResponse.swift
//  Capp
//
//  Created by tannaz on 11/28/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JResponse: ArrowParsable {
    
    var isSuccess =            false
    var code: Int           = 0 //MyStatusCode.connectionError.rawValue
    var message:            String? = nil
    var result:             ArrowParsable? = nil
    init() {}
    
    init(_ resultType: ArrowParsable.Type?) {
        self.result = resultType?.init()
    }
    
    mutating func deserialize(_ json: JSON) {
    
        isSuccess  <-- json["IsSuccess"]
        code    <-- json["Code"]
        message <-- json["Message"]
        if let jsonResult = json["Result"] {
            result?.deserialize(jsonResult)
            
        }
    }
    mutating func deserializeResult( _ json: JSON) {
        if let jsonResult = json["Result"] {
            result?.deserialize(jsonResult)
        }
    }
    
    mutating func parsResult( _ dic: Any?) {
        if let json = JSON(dic as? NSDictionary) {
            deserializeResult(json)
        } else {
            self = JResponse.noResponse
        }
    }
    
    mutating func parse(_ dictionary: Any?) {
        if let json = JSON(dictionary as? NSDictionary) {
            deserialize(json)
        } else {
            self = JResponse.noResponse
        }
    }
    
    static var notConnected: JResponse {
        get {
            var response = JResponse()
            response.code = MyStatusCode.connectionError.rawValue
            response.message = MyStatusCode.connectionError.message
            return response
        }
    }
    
    static var noResponse: JResponse {
        get {
            var response = JResponse()
            response.code = MyStatusCode.serverDown.rawValue
            response.message = MyStatusCode.serverDown.message
            return response
        }
    }
    
}
