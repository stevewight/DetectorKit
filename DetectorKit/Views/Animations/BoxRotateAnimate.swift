//
//  BoxRotateAnimate.swift
//  DetectorKit
//
//  Created by Steve on 4/14/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

class BoxRotateAnimate: NSObject {

    var box:CAShapeLayer!
    var index:Int!
    var mainView:BoxRotateView!
    
    init(_ inputBox:CAShapeLayer,_ inputIndex:Int,_ inputMainView:BoxRotateView) {
        super.init()
        box = inputBox
        index = inputIndex
        mainView = inputMainView
    }
    
    public func rotate() {
        box.add(rotateAnimation(), forKey: "rotateAnimation")
    }
    
    private func rotateAnimation()->CAAnimation {
        let timeFunc = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeInEaseOut
        )
        let time = CACurrentMediaTime()
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.duration = 1.6
        animation.beginTime = time - (Double(index) * animation.duration / 2)
        animation.repeatCount = MAXFLOAT
        animation.keyTimes = [0.0, 0.25, 0.50, 0.75, 1.0]
        animation.timingFunctions = [timeFunc, timeFunc, timeFunc, timeFunc, timeFunc]
        animation.values = transformValues()
        
        return animation
    }
    
    private func transformValues()->[NSValue] {
        let viewSize = mainView.bounds.size.width
        let boxSize = box.bounds.size.width
        let transSize = viewSize - boxSize
        
        var transOne = CATransform3DMakeTranslation(transSize, 0.0, 0.0)
        //transOne = CATransform3DRotate(transOne, 90.0, 0.0, 0.0, 1.0)
        transOne = CATransform3DScale(transOne, 0.25, 0.25, 1.0)
        
        var transTwo = CATransform3DMakeTranslation(transSize, transSize, 0.0)
        //transTwo = CATransform3DRotate(transTwo, 180, 0.0, 0.0, 1.0)
        transTwo = CATransform3DScale(transTwo, 1.0, 1.0, 1.0)
        
        var transThree = CATransform3DMakeTranslation(0.0, transSize, 0.0)
        //transThree = CATransform3DRotate(transThree, 270.0, 0.0, 0.0, 1.0)
        transThree = CATransform3DScale(transThree, 0.25, 0.25, 1.0)
        
        var transFour = CATransform3DMakeTranslation(0.0, 0.0, 0.0)
        //transFour = CATransform3DRotate(transFour, 360.0, 0.0, 0.0, 1.0)
        transFour = CATransform3DScale(transFour, 1.0, 1.0, 1.0)
        
        return [
            NSValue(caTransform3D:CATransform3DIdentity),
            NSValue(caTransform3D:transOne),
            NSValue(caTransform3D:transTwo),
            NSValue(caTransform3D:transThree),
            NSValue(caTransform3D:transFour)
        ]
    }
    
    private func degreesToRadians(_ degrees:Double)->CGFloat {
        let value = (degrees) / Double(180.0) * Double.pi
        return CGFloat(value)
    }
    
}
