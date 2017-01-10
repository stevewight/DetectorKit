//
//  BoxView.swift
//  Sherlock
//
//  Created by Steve on 12/6/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class BoxView: BaseFrameView {
    
    var boxes = [CAShapeLayer]()

    override internal func setUp() {
        setUpBoxes()
        setUpDashes()
        setUpAnimations()
    }
    
    private func pulse(_ shape:CAShapeLayer) {
        let animation = SpinAnimate(shape)
        animation.pulse()
    }
    
    private func slowPulse(_ shape:CAShapeLayer) {
        let animation = SpinAnimate(shape)
        animation.slowPulse()
    }
    
    private func setUpBoxes() {
        setUpBox(0)
        setUpBox(1)
        setUpBox(2)
    }
    
    private func setUpAnimations() {
        pulse(boxes[2])
        slowPulse(boxes[1])
    }
    
    private func setUpDashes() {
        boxes[1].lineDashPattern = [1.0]
        boxes[2].lineDashPattern = [1.0]
    }
    
    private func setUpBox(_ index:Int) {
        let box = createBox()
        box.path = createPath(box, index)
        layer.addSublayer(box)
        boxes.insert(box, at: index)
    }
    
    private func createBox()->CAShapeLayer {
        let box = CAShapeLayer()
        box.frame = layer.bounds
        box.fillColor = UIColor.clear.cgColor
        box.lineWidth = CGFloat(lineWidth)
        box.strokeColor = lineColor
        return box
    }
    
    private func createPath(_ shape:CAShapeLayer,_ index:Int)->CGPath {
        let inset = CGFloat(index * 5)
        var newRect:CGRect!
        if index > 0 {
            newRect = shape.bounds.insetBy(dx: inset, dy: inset)
        } else {
            newRect = shape.bounds
        }
        return UIBezierPath(rect: newRect).cgPath
    }

}
