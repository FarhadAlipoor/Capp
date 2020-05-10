//
//  TeminalMenuItemCell.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class TeminalMenuItemCell: UITableViewCell {
    
    @IBOutlet weak var lblFontIcon: UILabel!
    @IBOutlet weak var lblTitleRow: UILabel!
    
    func configure(_ item: JTerminalMenu) {
        lblFontIcon.text = item.icon
        lblTitleRow.text = item.name
        
    }
}
