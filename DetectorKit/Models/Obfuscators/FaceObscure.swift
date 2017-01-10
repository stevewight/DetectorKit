//
//  FaceObscure.swift
//  Sherlock
//
//  Created by Steve on 12/3/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class FaceObscure: BaseObscure {
    
    init(_ image:UIImage) {
        super.init()
        coreImage = CIImage(image: image)
        detector = FaceDetector(coreImage)
    }
    
}
