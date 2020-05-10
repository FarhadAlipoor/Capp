////
////  ItemSelections.swift
////  Capp
////
////  Created by tannaz on 11/20/17.
////  Copyright © 2017 Capp. All rights reserved.
////
//
//import Foundation
//import UIKit
//class ItemSelectionsVC: MyVC {
//private static let cellHeight = 46
//private var fullContentHeight = CGFloat()
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//    
//
//}
//
//override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//    
//    if preferredHeight == 0 {
//        fullContentHeight = CGFloat(ItemSelectionVC.cellHeight * viewModel.items.count) + cnsSearchBarHeight.constant
//        setContentHeight(fullContentHeight)
//        if contentHeight >= fullContentHeight {
//            tableView.isScrollEnabled = false
//        }
//    }
//}
//
//override func viewDidLayoutSubviews() {
//    super.viewDidLayoutSubviews()
//    // should be twice
//    if let selectedIndex = viewModel.selectedIndex {
//        tableView.scrollToRow(at: IndexPath(row: selectedIndex, section: 0), at: .bottom, animated: false)
//        tableView.scrollToRow(at: IndexPath(row: selectedIndex, section: 0), at: .bottom, animated: false)
//    }
//}
//
//}
//
//// is popupable
//extension ItemSelectionVC: Popupable {
//    func minHeight() -> CGFloat {
//        return 200
//    }
//    func maxHeight() -> CGFloat {
//        return min(UIScreen.main.bounds.height * 0.6, max(fullContentHeight, minHeight()))
//    }
//    func childHeight() -> CGFloat {
//        if fullContentHeight <= maxHeight() && fullContentHeight >= minHeight() {
//            return fullContentHeight
//        } else {
//            if fullContentHeight < minHeight() {
//                return minHeight()
//            } else {
//                return 300
//            }
//        }
//    }
//}
//
//extension ItemSelectionVC: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.items.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = viewModel.items[indexPath.row]
//        let cell    = tableView.dequeueReusableCell(withIdentifier: "item") as! ItemSelectionCell
//        cell.configure(with: item, isSelected: viewModel.isSelectionMenu ? false : item.id == viewModel.selectedID)
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.didSelect(indexPath)
//        if viewModel.autoDismiss {
//            dismissMe()
//        }
//    }
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y > 0 {
//            if preferredHeight < maxHeight() {
//                setPreferredHeight(preferredHeight + scrollView.contentOffset.y)
//                scrollView.contentOffset.y = 0
//            }
//        }
//    }
//    
//}

