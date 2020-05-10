//
//  CreditReportCell.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import UIKit

class CreditReportCell: UITableViewCell {

    @IBOutlet weak var lblIcon: UILabel!
    @IBOutlet weak var lblRowTitle: UILabel!
    @IBOutlet weak var lblCreditItem: UILabel!
    
    func configure(_ menuItem: MyMenuItems , credit: JCreditReport , indexPath: IndexPath) {
        lblIcon.text = menuItem.icon
        lblRowTitle.text = menuItem.name
        switch indexPath.row {
        case 0:
            lblCreditItem.text = credit.vts.rial()
        case 1:
            let creditTimeCapp : Int32 = Int32(credit.capp)
            let days = creditTimeCapp / 24
            let hour = creditTimeCapp % 24
            let daysInt = Int(days)
            let hoursInt = Int(hour)
            lblCreditItem.text = daysInt.day() + hoursInt.hours()
        case 2:
            lblCreditItem.text = credit.dsis.rial()
        default:
            break
        }
        
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
