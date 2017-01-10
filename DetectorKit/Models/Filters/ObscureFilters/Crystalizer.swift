//
//  Crystalizer.swift
//  Sherlock
//
//  Created by Steve on 12/4/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class Crystalizer: ObscureFilter {
    
    var inputRadius:Double = 33.0

    override init(_ image:CIImage) {
        super.init(image)
        setFilter()
    }
    
    init(_ image:CIImage,radius:Double) {
        super.init(image)
        inputRadius = radius
        setFilter()
    }
    
    private func setFilter() {
        filter = CIFilter(name: "CICrystallize")!
        filter.setValue(coreImage, forKey: kCIInputImageKey)
        filter.setValue(inputRadius, forKey: kCIInputRadiusKey)
    }
    
}
