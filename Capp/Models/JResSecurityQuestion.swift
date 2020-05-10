//
//  JResSecurityQuestion.swift
//  Capp
//
//  Created by tannaz on 12/4/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import Arrow

struct JResSecurityQuestion: ArrowParsable {
    
    var id                          = Int()
    var question                    = String()
    
    init() {}
    
    mutating func deserialize(_ json: JSON) {
        id                             <-- json["SecurityQuestionID"]
        question                       <-- json["Question"]

    }
    
    init?(warehouse: Warehouseable) {
        self.id = warehouse.get("ID") ?? 0
        self.question = warehouse.get("Question") ?? ""
    }
    
    static func parseRes(_ dictionary: Any?) -> JResSecurityQuestion {
        if let json = JSON(dictionary as? NSDictionary) {
            var one = JResSecurityQuestion()
            one.deserialize(json)
            return one
        }
        return JResSecurityQuestion()
    }
}
