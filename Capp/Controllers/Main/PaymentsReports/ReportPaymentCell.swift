//
//  ReportPaymentCell.swift
//  Capp
//
//  Created by Tannaz Parsa on 3/3/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import UIKit

class ReportPaymentCell: UITableViewCell {

    @IBOutlet weak var lblPackageName: UILabel!
    @IBOutlet weak var lblPackageType: UILabel!
    @IBOutlet weak var lblPackageAmount: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblTerminalName: UILabel!
    @IBOutlet weak var lblPaymentStatus: UILabel!
    
    func configure(_ paymentReport: JReportPayment) {
        lblPackageName.text = paymentReport.package
        lblPackageType.text = paymentReport.packageType
        lblPackageAmount.text = "\(paymentReport.amount)"
        lblDateTime.text = paymentReport.dateTime
        lblTerminalName.text = paymentReport.terminal
        if paymentReport.isSuccess {
            lblPaymentStatus.text = "SuccessFull".text
        } else {
            lblPaymentStatus.text = "UnSuccess".text
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
