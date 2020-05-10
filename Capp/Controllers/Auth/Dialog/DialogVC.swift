//
//  DialogVC.swift
//  Capp
//
//  Created by tannaz on 4/18/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit
protocol DialogDelegate {
    func didSelectSubmitBtn()
}

class DialogVC: MyVC {
    
    func configure(_ message: String , delagate: DialogDelegate) {
        lblMessage.text = message
        delegate = delagate
    }
    var delegate: DialogDelegate?
    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBAction func submitPressed(_ sender: Any) {
        delegate?.didSelectSubmitBtn()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        //location is relative to the current view
        // do something with the touched point
        if touch?.view != vwMain {
            dismiss(animated: true, completion: nil)
        }
    }
}
