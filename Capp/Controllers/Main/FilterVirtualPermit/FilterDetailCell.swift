//
//  FilterDetailCell.swift
//  Capp
//
//  Created by tannaz on 1/29/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import UIKit
protocol SelectedFilterDelegate{
    func selectedFilterIs(_ item: JTag)
}

class FilterDetailCell: UITableViewCell {

    @IBOutlet weak var lblTitleRow: UILabel!
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var lblCount: MyLabel!
    var delegate : SelectedFilterDelegate?
    var selectIndexPath: IndexPath?
    var isChecked: Bool = false
    var selectedTitle = ""
    func configure(_ title: String , count: String , filterDelegate: SelectedFilterDelegate , selectedIndexPath: IndexPath) {
        selectedTitle = title
        lblTitleRow.text = title
        lblCount.text = count
        delegate = filterDelegate
        selectIndexPath = selectedIndexPath
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnChackmarkPressed(_ sender: UIButton) {
        
        isChecked = !isChecked
        if isChecked {
            
            sender.setTitle("*", for: .normal)
        } else {
            sender.setTitle("&", for: .normal)
        }
        let selectedTag = JTag(title: selectedTitle, indexPath: selectIndexPath! , isSelected: isChecked)
        delegate?.selectedFilterIs(selectedTag)
    }
    
}
