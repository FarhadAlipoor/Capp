//
//  MyMenuItems.swift
//  Capp
//
//  Created by tannaz on 1/30/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

struct MyMenuItems {
    var name: String        = ""
    var icon: String        = ""
    var collapsed: Bool
    
    init(icon: String, name: String , collapsed:Bool = false) {
        self.icon    = icon
        self.name   = name
        self.collapsed = collapsed
    }
}
