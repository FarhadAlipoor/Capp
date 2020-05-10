//
//  SelectableItemsCell.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

protocol SelectedVehicle {
    func selectVehicleWith(indexPath: IndexPath)
}

class SelectableItemsCell: UITableViewCell {
    
    @IBOutlet weak var btnRadio: MyRadioButton!
    @IBOutlet weak var lblRowTitle: UILabel!
    var delegate: SelectedVehicle?
    var indexPath: IndexPath?
    func configureTrailerType(_ trailer: RTrailerType , selectedIndexPath: IndexPath , selectedDelegate: SelectedVehicle) {
        lblRowTitle.text = trailer.name
        self.indexPath = selectedIndexPath
        self.delegate = selectedDelegate
    }
    
    func configureTerminals(_ terminal: JTerminalResponse , selectedIndexPath: IndexPath , selectedDelegate: SelectedVehicle) {
        lblRowTitle.text = terminal.name
        self.indexPath = selectedIndexPath
        self.delegate = selectedDelegate

    }
    
    func configureFeedBacks(_ feedback: String , selectedIndexPath: IndexPath , selectedDelegate: SelectedVehicle ) {
        lblRowTitle.text = feedback
        self.indexPath = selectedIndexPath
        self.delegate = selectedDelegate

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func radioBtnPressed(_ sender: Any) {
        delegate?.selectVehicleWith(indexPath: indexPath!)
    }
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
