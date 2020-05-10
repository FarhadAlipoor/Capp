////
////  ItemSelections.swift
////  Capp
////
////  Created by tannaz on 11/20/17.
////  Copyright © 2017 Capp. All rights reserved.
////
//
import UIKit
import Foundation

class ItemSelectionVC: MyVC {
    private static let cellHeight = 60
    private static var fullContentHeight = CGFloat()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var imgUser: UIImageView!
    
    var items: [MyItemSelection] = [MyItemSelection(fontIcon: "", name: "name".text),
         MyItemSelection(fontIcon: "/", name: "Name".text),
         MyItemSelection(fontIcon: "/", name: "FamilyName".text),
         MyItemSelection(fontIcon: "0", name: "SmartCardNum".text),
         MyItemSelection(fontIcon: "s", name: "NationalCode".text),
         MyItemSelection(fontIcon: "s", name: "DrivingLicenseNum".text)]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if preferredHeight == 0 {
            //CGFloat(ItemSelectionVC.cellHeight * viewModel.items.count) + cnsSearchBarHeight.constant
        ItemSelectionVC.fullContentHeight = CGFloat(ItemSelectionVC.cellHeight * 5) + viewHeader.frame.height / 2 + 100
            setContentHeight(ItemSelectionVC.fullContentHeight)
            if contentHeight >= ItemSelectionVC.fullContentHeight {
                   //     tableView.isScrollEnabled = false
                    }
        }
    }
    
    @IBAction func contradictoryPressed(_ sender: Any) {
    }
    
    @IBAction func approvedPressed(_ sender: Any) {
    }
}

extension ItemSelectionVC: Popupable {
    func minHeight() -> CGFloat {
        return 200
    }
    func maxHeight() -> CGFloat {
        return min(UIScreen.main.bounds.height * 0.6, max(ItemSelectionVC.fullContentHeight, minHeight()))
    }
    func childHeight() -> CGFloat {
        if ItemSelectionVC.fullContentHeight <= maxHeight() && ItemSelectionVC.fullContentHeight >= minHeight() {
            return ItemSelectionVC.fullContentHeight
        } else {
            if ItemSelectionVC.fullContentHeight < minHeight() {
                return minHeight()
            } else {
                return 300
            }
        }
    }
}

extension ItemSelectionVC: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemSelectionCell", for: indexPath) as! ItemSelectionCell
        cell.lblFontIcon.text = items[indexPath.row].fontIcon
        cell.lblFontIcon.text = items[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



