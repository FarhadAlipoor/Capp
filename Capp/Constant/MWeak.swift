//
//  MWeak.swift
//  Capp
//
//  Created by tannaz on 11/21/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation

struct MWeak<T> {
    private weak var _reference:AnyObject?
    init(_ object:T) {_reference = object as? AnyObject}
    var reference:T? { return _reference as? T }
}
