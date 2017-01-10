//
//  ObscureFilter.swift
//  Sherlock
//
//  Created by Steve on 12/4/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class ObscureFilter: NSObject {

    let context = CIContext()
    var coreImage:CIImage!
    var filter:CIFilter!
    
    init(_ image:CIImage) {
        super.init()
        coreImage = image
    }
    
    public func output(features:[CIFeature])->UIImage {
        let final = featureMask(features)
        let cgImage = context.createCGImage(
            final,
            from: final.extent
        )
        return UIImage(cgImage: cgImage!)
    }
    
    internal func featureMask(_ features:[CIFeature])->CIImage {
        let masker = Masker(features)
        return masker.output(filter, coreImage)
    }
    
}
