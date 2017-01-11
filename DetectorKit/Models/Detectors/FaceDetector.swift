//
//  FaceDetector.swift
//  Sherlock
//
//  Created by Steve on 12/4/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

public class FaceDetector: BaseDetector {

    public var faces:[CIFeature]!
    public var detectBlink:Bool = false
    public var detectSmile:Bool = false
    
    init(_ image:CIImage) {
        super.init(image, type: CIDetectorTypeFace)
    }
    
    override public func features()->[CIFeature] {
        return faces
    }
    
    override internal func initializeOptions()->[String: Any] {
        return [
            CIDetectorAccuracy: CIDetectorAccuracyHigh,
            CIDetectorAspectRatio: 1.0
        ] as [String : Any]
    }
    
    override public func detect(_ image:CIImage) {
        let options:[String:Bool] = [
            CIDetectorSmile: detectSmile,
            CIDetectorEyeBlink: detectBlink
        ]
        faces = detector.features(in: image,options: options)
    }
    
}
