//
//  BoxPulseAnimate.swift
//  DetectorKit
//
//  Created by Steve on 4/17/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

class BoxPulseAnimate: NSObject {
    
    var box:CAShapeLayer!
    
    init(_ inputBox:CAShapeLayer) {
        super.init()
        box = inputBox
    }

    public func pulse() {
        box.add(heartBeat(), forKey: "pulse")
    }
    
    public func slowPulse() {
        box.add(slowHeartBeat(), forKey: "snap")
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
    
}
