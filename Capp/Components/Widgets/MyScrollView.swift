//
//  MyScrollView.swift
//  Chilivery
//
//  Created by Sina Khalili on 10/25/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import UIKit

class MyScrollView: UIScrollView {

    @IBInspectable open var centerVertically: Bool = false
    
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
        keyboardDismissMode = .interactive
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if centerVertically {
            if contentSize.height < frame.height {
                contentInset.top = (frame.height - contentSize.height) / 2
            }
        }
    }
    
}
