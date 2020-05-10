//
//  TurnReportCell.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import UIKit

class TurnReportCell: UITableViewCell {
    
    @IBOutlet weak var lblTurnNo: UILabel!
    @IBOutlet weak var lblPlateNo: UILabel!
    @IBOutlet weak var lblTerminalName: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    func configure(_ turn: JReportTurn) {
        lblTurnNo.text = "\(turn.turnNom)"
        lblPlateNo.text = "\(turn.plateNom)"
        lblTerminalName.text = Globals.shared.selectedTerminal.name
        lblDateTime.text = turn.date
        lblStatus.text = turn.status
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
