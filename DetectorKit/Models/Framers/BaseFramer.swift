//
//  BaseFramer.swift
//  Sherlock
//
//  Created by Steve on 12/6/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

public class BaseFramer: NSObject {

    public var shapeColor:UIColor = UIColor.red
    public var borderWidth:Double = 3.0
    var imageView:UIImageView!
    var coreImage:CIImage!
    var detector:BaseDetector!
    var converter:CoordConverter!
    
    public init(_ inputImageView:UIImageView) {
        super.init()
        imageView = inputImageView
        coreImage = CIImage(image: imageView.image!)
        converter = CoordConverter(
            coreImage.extent.size,
            imageView.bounds.size
        )
    }
    
    public func box() {
        buildBoxes(features: detector.features())
    }
    
    internal func buildBoxRotate(features:[CIFeature]) {
        for feature in features {
            addBoxRotate(feature: feature)
        }
    }
    
    internal func buildPulses(features:[CIFeature]) {
        for feature in features {
            addPulse(feature: feature)
        }
    }
    
    internal func buildBoxes(features:[CIFeature]) {
        for feature in features {
            addFrame(feature: feature)
        }
    }
    
    internal func buildRadials(features:[CIFeature]) {
        for feature in features {
            addRadial(feature: feature)
        }
    }
    
    private func addPulse(feature:CIFeature) {
        let newFrame = converter.convert(feature.bounds)
        let pulseView = PulseView(
            frame: newFrame,
            color: shapeColor.cgColor,
            width: borderWidth
        )
        imageView.addSubview(pulseView)
    }
    
    private func addBoxRotate(feature:CIFeature) {
        let newFrame = converter.convert(feature.bounds)
        let boxRotateView = BoxRotateView(
            frame: newFrame,
            color: shapeColor.cgColor,
            width: borderWidth
        )
        imageView.addSubview(boxRotateView)
    }
    
    private func addFrame(feature:CIFeature) {
        let newFrame = converter.convert(feature.bounds)
        let boxView = BoxView(
            frame: newFrame,
            color: shapeColor.cgColor,
            width: borderWidth
        )
        imageView.addSubview(boxView)
    }
    
    private func addRadial(feature:CIFeature) {
        let newFrame = converter.convert(feature.bounds)
        let radialView = RadialView(
            frame: newFrame,
            color: shapeColor.cgColor,
            width: borderWidth
        )
        imageView.addSubview(radialView)
    }
    
}
