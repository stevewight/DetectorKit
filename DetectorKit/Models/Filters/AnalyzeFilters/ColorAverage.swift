//
//  ColorAverage.swift
//  DetectorKit
//
//  Created by Steve on 5/13/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

public class ColorAverage: NSObject {
    
    var image:UIImage!
    var filter:CIFilter!
    
    public init(_ image:UIImage) {
        super.init()
        self.image = image
        buildFilter()
    }
    
    public func output()->UIColor {
        let cgImage = coreGraphicsImage()
        if let pixelData = cgImage.dataProvider!.data {
            let pos = CGPoint(x: 0, y: 0)
            let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
            let pixelInfo: Int = ((Int(image.size.width) * Int(pos.y)) + Int(pos.x)) * 4
            return buildColor(data: data, pixelInfo: pixelInfo)
        } else {
            return UIColor.black
        }
    }
    
    private func buildFilter() {
        let beginImage = CIImage(image: image)!
        let vectorRect = beginImage.extent
        filter = CIFilter(name: "CIAreaAverage")!
        filter.setValue(beginImage, forKey: "inputImage")
        filter.setValue(vectorRect, forKey: "inputExtent")
    }
    
    private func coreGraphicsImage()->CGImage {
        let outImage = filter.outputImage!
        let context = CIContext()
        return context.createCGImage(
            outImage,
            from: outImage.extent
        )!
    }
    
    private func buildColor(data:UnsafePointer<UInt8>,pixelInfo:Int)->UIColor {
        let r = CGFloat(data[pixelInfo+0]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
}
