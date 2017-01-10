//
//  CoordConverter.swift
//  Sherlock
//
//  Created by Steve on 12/10/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class CoordConverter: NSObject {

    var transform:CGAffineTransform!
    var imageSize:CGSize!
    var viewSize:CGSize!
    
    init(_ inputImageSize:CGSize,_ inputViewSize:CGSize) {
        super.init()
        imageSize = inputImageSize
        viewSize = inputViewSize
        transform = executeTransform()
    }
    
    public func convert(_ bounds:CGRect)->CGRect {
        
        var newBounds = bounds.applying(transform)
        let scale = calcScale()
        
        newBounds = newBounds.applying(scaleTranform(scale))
        newBounds.origin.x += calcOffsetX(scale)
        newBounds.origin.y += calcOffsetY(scale)
        
        return newBounds
    }
    
    private func executeTransform()->CGAffineTransform {
        let newTransform = CGAffineTransform(scaleX: 1, y: -1)
        return newTransform.translatedBy(x: 0, y: -imageSize.height)
    }
    
    private func calcScale()->CGFloat {
        return min(viewSize.width / imageSize.width,
                   viewSize.height / imageSize.height)
    }
    
    private func calcOffsetX(_ scale:CGFloat)->CGFloat {
        return (viewSize.width - imageSize.width * scale) / 2
    }
    
    private func calcOffsetY(_ scale:CGFloat)->CGFloat {
        return (viewSize.height - imageSize.height * scale) / 2
    }
    
    private func scaleTranform(_ scale:CGFloat)->CGAffineTransform {
        return CGAffineTransform(scaleX: scale, y: scale)
    }
    
}
