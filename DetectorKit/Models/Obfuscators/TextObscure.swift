//
//  TextObscure.swift
//  Sherlock
//
//  Created by Steve on 12/8/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class TextObscure: BaseObscure {
    
    init(_ image:UIImage) {
        super.init()
        coreImage = CIImage(image: image)
        detector = TextDetector(coreImage)
    }
    
}
