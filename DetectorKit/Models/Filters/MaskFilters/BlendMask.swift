//
//  BlendMask.swift
//  Sherlock
//
//  Created by Steve on 12/5/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class BlendMask: MaskFilter {
    
    // Compose all three images together to make final product
    init(_ image:CIImage,_ background:CIImage,_ mask:CIImage) {
        super.init()
        filter = CIFilter(name: "CIBlendWithMask")!
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(background, forKey: "inputBackgroundImage")
        filter.setValue(mask, forKey: "inputMaskImage")
    }
    
}
