//
//  CargoDetailsCell.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/27/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import UIKit

class CargoDetailsCell: UITableViewCell {

    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblOrigin: UILabel!
    @IBOutlet weak var lblDestination: UILabel!
    @IBOutlet weak var lblShippingRate: UILabel!
    @IBOutlet weak var btnStar: UIButton!
    var isFavorite: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnStar.setTitleColor(CappColors.green_light, for: .normal)
    }
    
    func configure(cargoVPS: JVPSCargo) {
        lblProductName.text = cargoVPS.cargo
        lblOrigin.text = Globals.shared.selectedTerminal.name
        lblDestination.text = cargoVPS.city
        lblShippingRate.text = "نرخ حمل:" + cargoVPS.cargoCost.rial()
    }
    
    @IBAction func btnStarPressed(_ sender: Any) {
        isFavorite = !isFavorite
        if isFavorite {
            btnStar.setTitle("p", for: .normal)
        } else {
            btnStar.setTitle("o", for: .normal)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
