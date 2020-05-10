//
//  TerminalPaymentsCell.swift
//  Capp
//
//  Created by tannaz on 2/10/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class TerminalPaymentsCell: UITableViewCell {
    
    @IBOutlet weak var lblRowTitle: UILabel!
    @IBOutlet weak var lblTitleIcon: UILabel!
    
    func configure(_ item: JResPackageType) {
        lblRowTitle.text = item.packageName
        lblTitleIcon.text = item.icon
        
    }
}
