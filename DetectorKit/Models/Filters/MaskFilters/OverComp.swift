//
//  OverComp.swift
//  Sherlock
//
//  Created by Steve on 12/5/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class OverComp: MaskFilter {
    
    // For composing the face(radial) to mask
    init(_ image:CIImage,_ background:CIImage) {
        super.init()
        filter = CIFilter(name: "CISourceOverCompositing")!
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(background, forKey: "inputBackgroundImage")
    }
    
}
