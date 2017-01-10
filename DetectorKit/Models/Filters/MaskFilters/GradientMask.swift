//
//  GradientMask.swift
//  Sherlock
//
//  Created by Steve on 12/9/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class GradientMask: MaskFilter {

    var bounds:CGRect!
    
    internal func getColors()->[CIColor] {
        let color0 = UIColor(
            red: 0.0, green: 1.0,
            blue: 0.0, alpha: 1.0
        )
        let color1 = UIColor(
            red: 0.0, green: 0.0,
            blue: 0.0, alpha: 0.0
        )
        return [
            CIColor(color: color0),
            CIColor(color: color1)
        ]
    }
    
}
