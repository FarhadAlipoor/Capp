//
//  ReceiveAndRevokeTurnVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/7/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class ReceiveAndRevokeTurnVC: MyVC {
    
    func configure( _ vtsTurn: JVTSResponse) {
        viewModel.vtsTurn = vtsTurn
    }
    
    let viewModel = ReceiveAndRevokeTurnVM()
    
    @IBOutlet weak var lblTerminalName: UILabel!
    @IBOutlet weak var lblTurnNom: UILabel!
    @IBOutlet weak var lblDateOfCreateTurn: UILabel!
    @IBOutlet weak var lblBeforeYou: UILabel!
    @IBOutlet weak var lblDateVisitTerminal: UILabel!
    @IBOutlet weak var lblAdminMessage: UILabel!

    override func viewDidLoad() {
        setupViews()
    }
    
    func setupViews() {
        if let terminals = StoringData.terminals {
            for terminal in terminals {
                if viewModel.vtsTurn?.turnNom == terminal.id {
                    lblTerminalName.text = terminal.name
                }
            }
        }
        lblTurnNom.text = "\(viewModel.vtsTurn?.turnNom ?? 0)"
        lblDateOfCreateTurn.text = viewModel.vtsTurn?.dateTime
        lblAdminMessage.text = viewModel.vtsTurn?.terminalMessage
    }
    
    
    @IBAction func btnInvalidTurnPressed(_ sender: Any) {
        
    }
    
}
