//
//  MyTriangleView.swift
//  Chilivery
//
//  Created by Tannaz Parsa on 12/17/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import Foundation
import UIKit

class MyTriangleView: UIView {

    override func draw(_ rect: CGRect) {
    // Drawing a triangle using UIBezierPath
    let context = UIGraphicsGetCurrentContext()
    
    // Paint the View Blue before drawing the traingle
        context!.setFillColor(UIColor.clear.cgColor)  // Set fill color
        context!.fill(rect) // Fill rectangle using the context data
    
    // Imagine a triangle resting on the bottom of the container with the base as the width of the rectangle, and the apex of the traingle at the top center of the container
    // The co-ordinates of the rectangle will look like
    // Top = (x: half of Container Width, y: 0 - origin)
    // Bottom Left = (x: 0, y: Container Height)
    // Bottom Right = (x: Container Width, y: Container Height)
    
    // Create path for drawing a triangle
    let trianglePath = UIBezierPath()
    // First move to the Top point
        trianglePath.move(to: CGPoint(x: self.bounds.width, y: 0.0))
    // Add line to Bottom Right
        trianglePath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
    // Add line to Bottom Left
        trianglePath.addLine(to: CGPoint(x: 0.0, y: self.bounds.height))
    // Complete path by drawing path to the Top
        trianglePath.addLine(to: CGPoint(x: self.bounds.width, y: 0.0))
    
    // Set the fill color
        context!.setFillColor(UIColor.white.cgColor)
    // Fill the triangle path
    trianglePath.fill()
}
}
