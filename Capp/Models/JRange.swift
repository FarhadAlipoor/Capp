//
//  JRange.swift
//  Capp
//
//  Created by tannaz on 2/20/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit
struct JRange {
    var minValue: CGFloat            = CGFloat()
    var indexPath: IndexPath?          = IndexPath()
    var maxValue:CGFloat            = CGFloat()
    
    init( minValue: CGFloat , indexPath: IndexPath  , maxValue: CGFloat) {
        self.minValue    = minValue
        self.indexPath   = indexPath
        self.maxValue = maxValue
        
    }
}
