//
//  MyTextField.swift
//  Chilivery
//
//  Created by Sina Khalili on 9/25/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import UIKit
import QuartzCore

//@IBDesignable
open class MyTextField: ACFloatingTextfield {
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        setup()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    func setup() {
        // {S} Set font
        font = Fonts.font(withSize: (self.font?.pointSize)!)
        // {E}
    }

    // {S} Move text a little because of IRANSans Font
    var topInset = CGFloat(0)
//    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 35)
//    override open func textRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.insetBy(dx: 0, dy: CGFloat(topInset),padding)
//    }
    
    
    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 50, dy: CGFloat(topInset))
    }
    // {E}
    
    

    open override func deleteBackward() {
        let beforeText = text
        super.deleteBackward()
        if let delegate = delegate as? MyTextFieldDelegate {
            delegate.textFieldDidDeleteBackward(self, beforeText: beforeText)
        }
    }
    
}
