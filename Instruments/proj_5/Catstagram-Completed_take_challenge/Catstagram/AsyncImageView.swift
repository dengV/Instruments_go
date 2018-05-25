//
//  AsyncImageLayer.swift
//  Catstagram-Starter
//
//  Created by Luke Parham on 2/20/17.
//  Copyright © 2017 Luke Parham. All rights reserved.
//

import Foundation

class AsyncImageView: UIView {
    private var _image: UIImage?
    
    var image: UIImage? {
        set {
            _image = newValue
            layer.contents = nil;
            guard let image = newValue else { return }
            DispatchQueue.global(qos: .userInitiated).async {
                let decodedImage = self.decodedImage(image)
                DispatchQueue.main.async {
                    self.layer.contents = decodedImage?.cgImage
                }
            }
        }
        
        get {
            return _image
        }
    }
    
    func decodedImage(_ image: UIImage) -> UIImage? {
        guard let newImage = image.cgImage else { return nil }
        
        let width = newImage.width
        let height = newImage.height
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: width*4, space: colorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
        context?.draw(newImage, in: CGRect(x: 0, y: 0, width: width, height: height))
        let drawnImage = context?.makeImage()
        if let drawnImage = drawnImage {
            let image = UIImage(cgImage: drawnImage)
            return image
        }
        return nil
    }
}
