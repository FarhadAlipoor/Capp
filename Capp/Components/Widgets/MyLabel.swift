//
//  MyLabel.swift
//  Chilivery
//
//  Created by Sina Khalili on 9/25/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import UIKit
import QuartzCore

//@IBDesignable
open class MyLabel: UILabel {
    
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
        if font!.fontName.contains(".SFUIText") {
            font = Fonts.font(withSize: (self.font?.pointSize)!)
        }
        // {E}
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // {S} Move text a little because of IRANSans Font
    var topInset = CGFloat(0.0), bottomInset = CGFloat(0), leftInset = CGFloat(0), rightInset = CGFloat(0)
    
    override open func drawText(in rect: CGRect) {
        
        let insets: UIEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
        
    }
    override open var intrinsicContentSize : CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }
    // {E}
    
}

