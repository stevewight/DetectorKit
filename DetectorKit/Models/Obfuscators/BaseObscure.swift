//
//  BaseObscure.swift
//  Sherlock
//
//  Created by Steve on 12/8/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class BaseObscure: NSObject {

    var coreImage:CIImage!
    var obscureFilter:ObscureFilter!
    var detector:BaseDetector!
    
    public func pixelate()->UIImage {
        obscureFilter = Pixelator(coreImage)
        return output()
    }
    
    public func crystalize()->UIImage {
        obscureFilter = Crystalizer(coreImage)
        return output()
    }
    
    internal func output()->UIImage {
        return obscureFilter.output(
            features: detector.features()
        )
    }
    
}
