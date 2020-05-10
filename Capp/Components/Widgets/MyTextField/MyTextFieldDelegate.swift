//
//  MyTextFieldDelegate.swift
//  Chilivery
//
//  Created by Sina Khalili on 10/29/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import UIKit

protocol MyTextFieldDelegate {
    // called when delete backward pressed
    func textFieldDidDeleteBackward(_ textField: UITextField, beforeText: String?)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool 
}
