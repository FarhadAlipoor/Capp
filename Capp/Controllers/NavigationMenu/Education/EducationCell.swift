//
//  EducationCell.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/24/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import UIKit

class EducationCell: UITableViewCell {

    @IBOutlet weak var lblTitleRow: UILabel!
    
    func configure(_ title: String) {
        lblTitleRow.text = title
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
