//
//  MaskFilter.swift
//  Sherlock
//
//  Created by Steve on 12/5/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class MaskFilter: NSObject {

    var filter:CIFilter!
    
    public func output()->CIImage {
        return filter.outputImage!
    }
    
}
