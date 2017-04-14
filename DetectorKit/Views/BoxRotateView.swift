//
//  BoxRotateView.swift
//  DetectorKit
//
//  Created by Steve on 4/14/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

class BoxRotateView: BaseFrameView {

    var boxes = [CAShapeLayer]()
    
    override internal func setUp() {
        setUpBoxes()
        setUpAnimations()
    }
    
    private func setUpBoxes() {
        let boxSize = bounds.size.width / 6.0
        let boxFrame = CGRect(
            x: 0.0,
            y: 0.0,
            width: boxSize,
            height: boxSize
        )
        setUpBox(0, boxFrame)
        setUpBox(1, boxFrame)
    }
    
    private func setUpBox(_ index:Int,_ frame:CGRect) {
        let baseLayer = createBox(frame)
        layer.addSublayer(baseLayer)
        boxes.insert(baseLayer, at: index)
    }
    
    private func setUpAnimations() {
        rotate(boxes[0],0)
        rotate(boxes[1],1)
    }
    
    private func rotate(_ box:CAShapeLayer,_ index:Int) {
        let animation = BoxRotateAnimate(box, index, self)
        animation.rotate()
    }
    
    private func createBox(_ frame:CGRect)->CAShapeLayer {
        let box = CAShapeLayer()
        box.frame = frame
        box.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        box.backgroundColor = lineColor
        box.shouldRasterize = true
        box.rasterizationScale = UIScreen.main.scale
        return box
    }

}
