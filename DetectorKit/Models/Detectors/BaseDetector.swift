//
//  BaseDetector.swift
//  Sherlock
//
//  Created by Steve on 12/8/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class BaseDetector: NSObject {
    
    var detector:CIDetector!
    
    init(_ image:CIImage, type:String) {
        super.init()
        detector = CIDetector(
            ofType: type,
            context: nil,
            options: initializeOptions()
        )
        detect(image)
    }
    
    public func features()->[CIFeature] {
        preconditionFailure("Must be overridden")
    }
    
    public func detect(_ image:CIImage) {
        preconditionFailure("Must be overridden")
    }
    
    internal func initializeOptions()->[String: Any] {
        return [
            CIDetectorAccuracy: CIDetectorAccuracyHigh
        ] as [String: Any]
    }
    
}
