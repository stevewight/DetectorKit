//
//  BaseFramer.swift
//  Sherlock
//
//  Created by Steve on 12/6/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class BaseFramer: NSObject {

    var imageView:UIImageView!
    var coreImage:CIImage!
    var shapeColor:UIColor = UIColor.red
    var borderWidth:Double = 3.0
    var detector:BaseDetector!
    var converter:CoordConverter!
    
    init(_ inputImageView:UIImageView) {
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
