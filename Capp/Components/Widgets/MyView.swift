//
//  MyView.swift
//  Chilivery
//
//  Created by Sina Khalili on 10/26/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import UIKit

//@IBDesignable
class MyView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
}
