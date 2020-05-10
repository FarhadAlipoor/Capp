//
//  PaymentPackageCell.swift
//  Capp
//
//  Created by tannaz on 2/18/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

protocol SelectedPackage {
    func selectPackageWith(indexPath: IndexPath)
}

class PaymentPackageCell: UITableViewCell {
    
    @IBOutlet weak var btnRadio: MyRadioButton!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPackageTitle: UILabel!
    @IBOutlet weak var lblExpireTime: UILabel!
    @IBOutlet weak var lblPackageAmount: UILabel!
    var indexPath: IndexPath?
    var delegate: SelectedPackage?
    func configure(_ package:JPayPackage , selectedDelegate: SelectedPackage , selectedIndexPath: IndexPath) {
        lblPackageTitle.text = package.title
        lblDescription.text = package.description
        lblExpireTime.text = package.nameDate
        lblPackageAmount.text = package.amount.rial()
        self.delegate = selectedDelegate
        self.indexPath = selectedIndexPath
    }
    @IBAction func radioBtnPressed(_ sender: Any) {
        delegate?.selectPackageWith(indexPath: indexPath!)
    }
}
