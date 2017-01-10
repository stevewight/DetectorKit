//
//  SpinAnimate.swift
//  Sherlock
//
//  Created by Steve on 12/10/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class SpinAnimate: NSObject {
    
    var circle:CAShapeLayer!
    
    init(_ inputCircle:CAShapeLayer) {
        super.init()
        circle = inputCircle
    }
    
    public func complex() {
        circle.add(endAnimation(), forKey: "strokeEnd")
        circle.add(startAnimation(), forKey: "strokeStart")
        circle.add(rotateClockwise(), forKey: "rotate")
    }
    
    public func rotate() {
        circle.add(rotateClockwise(), forKey: "rotateClockwise")
    }
    
    public func pulse() {
        circle.add(heartBeat(), forKey: "pulse")
    }
    
    public func slowPulse() {
        circle.add(slowHeartBeat(), forKey: "snap")
    }
    
    private func endAnimation()->CAAnimation {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        return addToGroup(animation)
    }
    
    private func startAnimation()->CAAnimation {
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.beginTime = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        return addToGroup(animation)
    }
    
    private func rotateClockwise()->CAAnimation {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        animation.duration = 4
        animation.repeatCount = MAXFLOAT
        return animation
    }
    
    private func heartBeat()->CAAnimation {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 0.6
        animation.repeatCount = MAXFLOAT
        return animation
    }
    
    private func slowHeartBeat()->CAAnimation {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.7
        animation.toValue = 1.1
        animation.duration = 1.8
        animation.repeatCount = MAXFLOAT
        return animation
    }
    
    private func addToGroup(_ animation:CAAnimation)->CAAnimation {
        let group = CAAnimationGroup()
        group.duration = 2.5
        group.repeatCount = MAXFLOAT
        group.animations = [animation]
        
        return group
    }
    
}
