//
//  PulseView.swift
//  DetectorKit
//
//  Created by Steve on 4/12/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

class PulseView: BaseFrameView {
    
    var circles = [CAShapeLayer]()

    override internal func setUp() {
        setUpCircle()
        setUpAnimations()
    }
    
    private func setUpCircle() {
        let baseLayer = createCircle()
        baseLayer.path = createPath(baseLayer,0)
        layer.addSublayer(baseLayer)
        circles.insert(baseLayer, at:0)
    }
    
    private func setUpAnimations() {
        pulse(circles[0])
    }
    
    private func pulse(_ circle:CAShapeLayer) {
        let animation = CirclePulseAnimate(circle)
        animation.pulse()
    }
    
    private func createCircle()->CAShapeLayer {
        let circle = CAShapeLayer()
        circle.frame = layer.bounds
        circle.fillColor = lineColor
        circle.strokeColor = lineColor
        circle.lineWidth = CGFloat(lineWidth)
        
        return circle
    }
    
    private func createPath(_ circle:CAShapeLayer,_ index:Int)->CGPath {
        let size = circle.bounds.size
        let radius = size.width/2
        let rectPath = CGRect(
            x: 0.0,
            y: 0.0,
            width: size.width,
            height: size.height
        )
        return UIBezierPath(
            roundedRect: rectPath,
            cornerRadius: radius
        ).cgPath
    }

}
