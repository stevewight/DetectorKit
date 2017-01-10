//
//  Masker.swift
//  Sherlock
//
//  Created by Steve on 12/4/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class Masker: NSObject {

    var features:[CIFeature]!
    
    init(_ features:[CIFeature]) {
        super.init()
        self.features = features
    }
    
    public func output(_ filter:CIFilter,_ image:CIImage)->CIImage {
        let featuresMask = featuresToImage()
        return filterMask(
            featuresMask,
            image: image,
            filter: filter
        )
    }
    
    private func featuresToImage()->CIImage {
        var finalMask = CIImage()
        for feature in features {
            let maskFeature = MaskFeature(feature, finalMask)
            finalMask = maskFeature.output()
        }
        return finalMask
    }
    
    private func filterMask(_ mask:CIImage,image:CIImage,filter:CIFilter)->CIImage {
        let blendFilter = BlendMask(filter.outputImage!,image,mask)
        return blendFilter.output()
    }
    
}
