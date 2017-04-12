//
//  CirclePulseAnimate.swift
//  DetectorKit
//
//  Created by Steve on 4/13/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

class CirclePulseAnimate: NSObject {

    var circle:CAShapeLayer!
    
    init(_ inputCircle:CAShapeLayer) {
        super.init()
        circle = inputCircle
    }
    
    public func pulse() {
        circle.add(pulseAnimation(), forKey: "pulseAnimation")
    }
    
    private func pulseAnimation()->CAAnimation {
        let group = CAAnimationGroup()
        group.animations = [scaleAnimation(), opacityAnimation()]
        group.duration = 0.6
        group.timingFunction = CAMediaTimingFunction(
            name: kCAMediaTimingFunctionEaseInEaseOut
        )
        group.repeatCount = MAXFLOAT
        return group
    }
    
    private func scaleAnimation()->CAAnimation {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 0.6
        animation.repeatCount = MAXFLOAT
        return animation
    }
    
    private func opacityAnimation()->CAAnimation {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.duration = 0.6
        animation.repeatCount = MAXFLOAT
        return animation
    }
    
}
