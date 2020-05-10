//
//  SelectableItemsVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol SelectedTrailer {
    func selectTrailer(_ selectedTrailer: RTrailerType)
}
protocol SelectedFeedBackType {
    func selectedFeedbackTypeIs(_ type: String , typeCode: Int)
}

class SelectableItemsVC: MyVC , SelectedVehicle , SSRadioButtonControllerDelegate {
    
    let viewModel = SelectableItemsVM()
    let feedbackItems = ["Censure".text , "Suggestion".text , "ErrorReport".text]
    var delegate: SelectedFeedBackType?
    func configure(mode: SelectableItemsVM.Mode, terminals: [JTerminalResponse]? = nil , delegate: SelectedFeedBackType? = nil) {
        viewModel.mode = mode
        viewModel.terminals = terminals
        self.delegate = delegate
    }
    
    func didSelectButton(selectedButton: UIButton?, index: Int) {
         NSLog(" \(String(describing: selectedButton))" )
    }
    

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var trailerDelegate: SelectedTrailer?
    let trailers = try! Realm().objects(RTrailerType.self)
    var selectedTrailer: RTrailerType?
    var selectedTerminal: JTerminalResponse?
    var radioButtonController: MyRadioButtonController?
    var selectedFeedBack : String?
    var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        radioButtonController = MyRadioButtonController()
        radioButtonController?.delegate = self;
        radioButtonController?.respectTableView = true;
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if viewModel.mode == .terminals {
            lblTitle.text = "Terminals".text
        }
    }
    
    @objc func handleTapGesture() {
        dismissMe()
    }
    func selectVehicleWith(indexPath: IndexPath) {
        switch viewModel.mode {
        case .trailersType:
            selectedTrailer = trailers[indexPath.row]
        case .terminals:
            selectedTerminal = viewModel.terminals?[indexPath.row]
        case .feedback:
            selectedFeedBack = feedbackItems[indexPath.row]
        }
    }
    
    @IBAction func btnCancelPressed(_ sender: Any) {
        dismissMe()
    }
    @IBAction func btnSubmitPressed(_ sender: Any) {
        switch viewModel.mode {
        case .trailersType:
            if selectedTrailer != nil {
                trailerDelegate?.selectTrailer(selectedTrailer!)
                dismissMe()
            }
        case .terminals:
            if selectedTerminal != nil {
                viewModel.requestToGetTerminalMenuItem((selectedTerminal?.id)!, onSuccess: successToGetTerminalMenuItems, onFailure: failure)
            }
            break
            
        case .feedback:
            if selectedFeedBack != nil {
                delegate?.selectedFeedbackTypeIs(selectedFeedBack! , typeCode: (selectedIndexPath?.row)! + 1)
                dismissMe()
            }
            break
        }
        
    }
    func successToGetTerminalMenuItems() {
        let terminalMenuItemsVC = Storyboards.main.instantiateViewController(withIdentifier: "terminalMenuItemsVc") as! TerminalMenuItemsVC
        terminalMenuItemsVC.configure(viewModel.menuItems!, terminals: viewModel.terminals! , selectedTerminal: selectedTerminal!)
        let mynav = MyNav(rootViewController: terminalMenuItemsVC, patternNavBar: false)
        present(mynav, animated: true, completion: nil)
    }
}
extension SelectableItemsVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.mode {
        case .terminals:
            return viewModel.terminals?.count ?? 0
        case .trailersType:
            return trailers.count

        case .feedback:
         return  feedbackItems.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectableItemCell", for: indexPath) as! SelectableItemsCell
        switch viewModel.mode {
        case .trailersType:
            cell.configureTrailerType(trailers[indexPath.row] , selectedIndexPath: indexPath , selectedDelegate: self)
        
        case .terminals:
            cell.configureTerminals(viewModel.terminals![indexPath.row] , selectedIndexPath: indexPath , selectedDelegate: self)
        case .feedback:
            selectedIndexPath = indexPath
            cell.configureFeedBacks(feedbackItems[indexPath.row], selectedIndexPath: indexPath, selectedDelegate: self)
        }
        cell.btnRadio.tag = indexPath.row
        radioButtonController?.addButton(cell.btnRadio)
        cell.btnRadio.isSelected = (radioButtonController?.isSelected(index: indexPath.row))!
        cell.btnRadio.toggleButon()
        return cell
    }
}
