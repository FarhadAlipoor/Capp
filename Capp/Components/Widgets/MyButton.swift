//
//  MyButton.swift
//  Chilivery
//
//  Created by Sina Khalili on 9/25/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import UIKit
import QuartzCore

//@IBDesignable
open class MyButton: UIButton {
    
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
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
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
        if titleLabel!.font!.fontName.contains(".SFUIText") {
            titleLabel!.font = Fonts.regular(withSize: titleLabel!.font.pointSize)
        }
        // {E}
        
        // Text position
        titleLabel?.textAlignment = .center
        
        /*if image(for: .normal) != nil && titleLabel!.text != nil {
            titleEdgeInsets = UIEdgeInsetsMake(6, 0, 0, imageView!.frame.size.width + 4)
            // {S} Move image to right and configure it
            imageEdgeInsets = UIEdgeInsetsMake(2*(frame.height - imageView!.frame.height / 2), frame.width - (imageView!.frame.size.width/2 + 12), 2*(frame.height - imageView!.frame.height / 2), 8)
            // {E}
        } else {
        }*/
        titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)

        // {S} Corner radius
        if layer.cornerRadius == 0 {
            layer.cornerRadius = frame.height / 2
        }
        // {E}
    
        layer.masksToBounds = true
        
    }
    
}
