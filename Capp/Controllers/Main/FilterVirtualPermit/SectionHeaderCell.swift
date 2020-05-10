//
//  SectionHeaderCell.swift
//  Capp
//
//  Created by tannaz on 1/29/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import UIKit

//protocol CollapsibleTableViewHeaderDelegate {
//    func toggleSection(_ header: SectionHeaderCell, section: Int)
//}

class SectionHeaderCell: UITableViewCell {

    //var delegate: CollapsibleTableViewHeaderDelegate?
    //var section: Int = 0
    
    @IBOutlet weak var lblArrow: UILabel!
    @IBOutlet weak var lblIcon: UILabel!
    @IBOutlet weak var lblRowTitle: UILabel!
    
    func configure(item : MyMenuItems) {
        lblIcon.text = item.icon
        lblRowTitle.text = item.name
     //   addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapHeader(_:))))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
//   @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
//        guard let cell = gestureRecognizer.view as? SectionHeaderCell else {
//            return
//        }
//        
//       // delegate?.toggleSection(self, section: cell.section)
//    }
    
    func setCollapsed(_ collapsed: Bool) {
        //
        // Animate the arrow rotation (see Extensions.swf)
        //
        lblArrow.rotate(collapsed ? 0.0 : .pi / 2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
