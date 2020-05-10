//
//  SettingsCell.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/25/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {

    @IBOutlet weak var lblRowIcon: UILabel!
    @IBOutlet weak var lblRowTitle: UILabel!
    
    func configure(_ item: MyMenuItems) {
        lblRowIcon.text = item.icon
        lblRowTitle.text = item.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
