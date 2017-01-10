//
//  TextFramer.swift
//  Sherlock
//
//  Created by Steve on 12/6/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class TextFramer: BaseFramer {
    
    override init(_ imageView:UIImageView) {
        super.init(imageView)
        detector = TextDetector(coreImage)
    }
    
}
