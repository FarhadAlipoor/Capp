//
//  MenuItemCell.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import UIKit

class MenuItemCell: UITableViewCell {

    @IBOutlet weak var lblRowTitle: UILabel!
    @IBOutlet weak var lblIcon: UILabel!
    
    func configure(_ item: MyMenuItems) {
        lblRowTitle.text = item.name
        lblIcon.text = item.icon
        
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
