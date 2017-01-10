//
//  Pixelator.swift
//  Sherlock
//
//  Created by Steve on 12/4/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class Pixelator: ObscureFilter {
    
    var inputScale:Double = 33.0
    
    override init(_ image:CIImage) {
        super.init(image)
        setFilter()
    }
    
    init(_ image:CIImage, scale:Double) {
        super.init(image)
        inputScale = scale
        setFilter()
    }
    
    private func setFilter() {
        filter = CIFilter(name: "CIPixellate")!
        filter.setValue(coreImage, forKey: kCIInputImageKey)
        filter.setValue(inputScale, forKey: kCIInputScaleKey)
    }
    
}
