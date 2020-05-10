//
//  MyRadioButtonModel.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class SSRadioButtonModel: NSObject {
    public var isSelected = false
    var button : UIButton
    
    init(button: UIButton, selected isSelected: Bool = false) {
        self.isSelected = isSelected;
        self.button = button
    }
}
