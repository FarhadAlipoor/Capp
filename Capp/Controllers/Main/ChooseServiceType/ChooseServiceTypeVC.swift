//
//  ChooseServiceTypeVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class ChooseServiceTypeVC: MyVC  {
    
    let viewModel = ChooseServiceTypeVM()
    @IBOutlet weak var btnTerminalServices: UIButton!
    @IBOutlet weak var btnTerminalServicesText: UIButton!
    @IBOutlet weak var btnCargoServices: UIButton!
    @IBOutlet weak var btnCargoServicesText: UIButton!
    
    override func viewDidLoad() {
        title = "ChooseServiceType".text
        addSlideMenuButton()
    }
    @IBAction func btnTerminalServicesPressed(_ sender: Any) {
        showLoading()
        viewModel.requestToGetAllTerminals(onSuccess: successToGetAllTerminals, onFailure: failure)
    }
    override func successToGetAllTerminals() {
        hideLoading()
        let selectableItemsVC = Storyboards.main.instantiateViewController(withIdentifier: "selectableItemsVc") as! SelectableItemsVC
        selectableItemsVC.configure(mode: .terminals, terminals: viewModel.terminals)
        present(selectableItemsVC, animated: false, completion: nil)
    }
    @IBAction func btnCargoServicesPressed(_ sender: Any) {

    }
}
