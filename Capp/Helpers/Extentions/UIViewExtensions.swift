//
//  UIViewExtensions.swift
//  Chilivery
//
//  Created by Sina Khalili on 9/25/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import UIKit
// import GSMessages

extension UIView {

    class func loadFromNib(name: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(
            nibName: name,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    func addShadow() {
        layer.masksToBounds = false
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.6
    }
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor , frame: CGRect? = nil){
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        if frame == nil {
            gradientLayer.frame = self.bounds
        } else {
            gradientLayer.frame = frame!
        }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        print(gradientLayer.frame)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        self.layer.add(animation, forKey: nil)
    }

}

