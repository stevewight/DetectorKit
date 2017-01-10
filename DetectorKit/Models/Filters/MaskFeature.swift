//
//  MaskFeature.swift
//  Sherlock
//
//  Created by Steve on 12/9/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class MaskFeature: NSObject {
    
    var feature:CIFeature!
    var baseMask:CIImage!
    
    init(_ inputFeature:CIFeature,_ inputMask:CIImage) {
        feature = inputFeature
        baseMask = inputMask
    }
    
    internal func output()->CIImage {
        return overCompImage(mask(), baseMask)
    }

    internal func mask()->CIImage {
        if feature.type == CIFeatureTypeFace {
            return radialImage()
        } else {
            return rectImage()
        }
    }
    
    private func rectImage()->CIImage {
        let rectFilter = RectGradient(feature.bounds)
        return rectFilter.output()
    }
    
    private func radialImage()->CIImage {
        let radialFilter = RadialGradient(feature.bounds)
        return radialFilter.output()
    }
    
    private func overCompImage(_ shape:CIImage,_ background:CIImage)->CIImage {
        let overCompFilter = OverComp(shape, background)
        return overCompFilter.output()
    }
    
}
