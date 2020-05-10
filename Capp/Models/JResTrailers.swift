//
//  JResTrailers.swift
//  Capp
//
//  Created by tannaz on 12/31/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import Arrow

// response of `user addresses list` api
struct JResTrailers: ArrowParsable {
    var trailers = [JTrailer]()
    
    mutating func deserialize(_ json: JSON) {
        trailers <-- json // it's array of array string
    }
}
