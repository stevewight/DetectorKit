//
//  TextFramer.swift
//  Sherlock
//
//  Created by Steve on 12/6/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

public class TextFramer: BaseFramer {
    
    public override init(_ imageView:UIImageView) {
        super.init(imageView)
        detector = TextDetector(coreImage)
    }
    
}
