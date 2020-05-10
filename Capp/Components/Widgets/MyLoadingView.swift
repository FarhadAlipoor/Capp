//
//  MyLoadingView.swift
//  Chilivery
//
//  Created by Sina Khalili on 11/14/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import Foundation
import Kingfisher

class MyLoadingView: MyView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    
    var imageView = AnimatedImageView()
    func setup() {
        backgroundColor = UIColor.clear
        imageView.loadGif(name: "loading")
        imageView.animationDuration = 0.2
        imageView.frame = CGRect(x: frame.width / 2 - 50, y: frame.height / 2 - 50, width: 100, height: 100)
        addSubview(imageView)
    }
    func show() {
        isHidden = false
    }
    
    func hide() {
        isHidden = true
    }
    
    static var loadingCell: UITableViewCell {
        let cell = UITableViewCell()
        let loadingView = MyLoadingView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 50, y: 50, width: 100, height: 100))
        cell.addSubview(loadingView)
        cell.backgroundColor = UIColor.clear
        return cell
    }

}
