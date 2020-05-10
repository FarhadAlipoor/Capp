//
//  JTag.swift
//  Capp
//
//  Created by tannaz on 2/20/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

struct JTag {
    var title: String              = ""
    var indexPath: IndexPath?      = IndexPath()
    var isSelected: Bool           = false
    
    init( title: String , indexPath: IndexPath  , isSelected: Bool = false) {
        self.title    = title
        self.indexPath   = indexPath
        self.isSelected = isSelected
    }
}
