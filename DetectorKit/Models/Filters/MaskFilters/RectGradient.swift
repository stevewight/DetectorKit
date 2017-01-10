//
//  RectGradient.swift
//  Sherlock
//
//  Created by Steve on 12/8/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class RectGradient: GradientMask {
    
    // Get Rect from feature
    init(_ inputBounds:CGRect) {
        super.init()
        bounds = inputBounds
        setFilter()
    }
    
    override public func output() -> CIImage {
        let outImage = filter.outputImage!
        return outImage.cropping(to: bounds)
    }
    
    private func setFilter() {
        let startVector = getStartVector()
        let endVector = getEndVector()
        let colors = getColors()
        
        filter = CIFilter(name: "CILinearGradient")!
        filter.setValue(startVector, forKey: "inputPoint0")
        filter.setValue(endVector, forKey: "inputPoint1")
        filter.setValue(colors.first!, forKeyPath: "inputColor0")
        filter.setValue(colors.last!, forKeyPath: "inputColor1")
    }
    
    private func getStartVector()->CIVector {
        return CIVector(cgRect: bounds)
    }
    
    private func getEndVector()->CIVector {
        return CIVector(cgRect: bounds)
    }

}
