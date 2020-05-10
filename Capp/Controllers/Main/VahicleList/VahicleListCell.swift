//
//  VahicleListCell.swift
//  Capp
//
//  Created by tannaz on 12/24/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit
protocol EditSelectedVehicle {
    func editVehicle(indexPath: IndexPath , trailer:RTrailerType)
}

class VahicleListCell: UITableViewCell {
    
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet var lblPlateNom: UILabel!
    @IBOutlet var lblVehicleType: UILabel!
    @IBOutlet var lblCardNom: UILabel!
    @IBOutlet var lblStatusInOrg: UILabel!
    @IBOutlet var vwTriangle: MyTriangleView!
    var editDelegate: EditSelectedVehicle?
    var indexPath: IndexPath?
    var trailer: RTrailerType?
    func configure( _ vehicleItem: JVehicle , editDelegate: EditSelectedVehicle , selectedIndex: IndexPath) {
        trailer = RTrailerType.getWith(id: vehicleItem.trailerTypeID)
        
        let plateNo = "\(vehicleItem.plateNo)"
        let firstPart = (plateNo[...1])
        let secondPart = (plateNo.subString(startIndex: 4, endIndex: 6))
        lblPlateNom.text = secondPart + "E".text + firstPart + "ایران" + "\(vehicleItem.plateSerialNo)"
        
        lblVehicleType.text = trailer?.name
        lblCardNom.text = "\(vehicleItem.vehicleCardNo)"
        if vehicleItem.isActiveOrg {
            lblStatusInOrg.text = "Active".text
        } else {
            lblStatusInOrg.text = "DeActive".text
        }
        self.editDelegate = editDelegate
        indexPath = selectedIndex
        if vehicleItem.isActiveCapp {
            vwTriangle.isHidden = false
            return
        } else {
            vwTriangle.isHidden = true
        }

    }
    
    override func awakeFromNib() {
        backgroundColor = CappColors.gray_light
    }
    
    @IBAction func btnEditPressed(_ sender: Any) {
        editDelegate?.editVehicle(indexPath: indexPath!, trailer: trailer!)
    }

}

extension String {
    subscript(value: PartialRangeUpTo<Int>) -> Substring {
        get {
            return self[..<index(startIndex, offsetBy: value.upperBound)]
        }
    }
    
    subscript(value: PartialRangeThrough<Int>) -> Substring {
        get {
            return self[...index(startIndex, offsetBy: value.upperBound)]
        }
    }
    
    subscript(value: PartialRangeFrom<Int>) -> Substring {
        get {
            return self[index(startIndex, offsetBy: value.lowerBound)...]
        }
    }
}
