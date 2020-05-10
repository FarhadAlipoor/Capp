//
//  PermitReportCell.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import UIKit

class PermitReportCell: UITableViewCell {

    @IBOutlet weak var lblPermitNo: UILabel!
    @IBOutlet weak var lblPermitDateTime: UILabel!
    @IBOutlet weak var lblPermitType: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblCargoType: UILabel!
    
    func configure(_ permit: JPermitVPSResponse) {
        lblPermitNo.text = "\(permit.permitNo)"
        lblPermitDateTime.text = permit.dateTime
        lblPermitType.text = ""
        lblCompanyName.text = permit.company
        lblCargoType.text = permit.cargo
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
