//
//  CommunicationSettingsCell.swift
//  Capp
//
//  Created by tannaz on 2/25/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import UIKit
protocol SelectedCommunication {
    func selectedCommunicationIs(_ indexPath: IndexPath)
}

class CommunicationSettingsCell: UITableViewCell {

    @IBOutlet weak var lblRowTitle: UILabel!
    @IBOutlet weak var btnCheckMark: UIButton!
    var delegate: SelectedCommunication?
    var indexPath: IndexPath?
    var isChecked: Bool = false
    
    func configure(_ item: String , delegate: SelectedCommunication , selectedIndexPath: IndexPath) {
        lblRowTitle.text = item
        self.delegate = delegate
        self.indexPath = selectedIndexPath
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnCheckMarkPressed(_ sender: Any) {
        isChecked = !isChecked
        if isChecked {
            btnCheckMark.setTitle("*", for: .normal)
        } else {
            btnCheckMark.setTitle("&", for: .normal)
        }
        delegate?.selectedCommunicationIs(indexPath!)
    }
    
}
