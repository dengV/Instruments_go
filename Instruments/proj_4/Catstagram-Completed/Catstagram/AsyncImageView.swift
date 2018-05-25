//
//  AsyncImageView.swift
//  Catstagram
//
//  Created by Luke Parham on 4/13/17.
//  Copyright © 2017 Luke Parham. All rights reserved.
//

import UIKit

class AsyncImageView: UIView {
    private var _image: UIImage?
    
    var image: UIImage? {
        get {
            return _image
        }
        
        set {
            _image = newValue
            
            layer.contents = nil
            guard let image = newValue else { return }
            
            DispatchQueue.global(qos: .userInitiated).async {
                let decodedImage = self.decodedImage(image)
                DispatchQueue.main.async {
                    self.layer.contents = decodedImage?.cgImage
                }
            }
        }
    }
    
    
    
    
    func decodedImage(_ image: UIImage) -> UIImage? {
        guard let newImage = image.cgImage else { return nil }
        
        let cacheImage = AsyncImageView.globalCache.object(forKey: image)
        if let cachedImage = cacheImage as? UIImage {
            return cachedImage
        }// cache 后面 有一个 d
        
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: nil, width: newImage.width, height: newImage.height, bitsPerComponent: 8, bytesPerRow: newImage.width * 4, space: colorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
        
        context?.draw(newImage, in: CGRect(x: 0, y: 0, width: newImage.width, height: newImage.height))
        let decodedImage = context?.makeImage()
        
        if let decodedImage = decodedImage {
          //  AsyncImageView.globalCache.setObject(decodedImage, forKey: image)
          //   return UIImage(cgImage: decodedImage)
            let decodedImage_dng = UIImage(cgImage: decodedImage)
            AsyncImageView.globalCache.setObject(decodedImage_dng, forKey: image)
            
            return decodedImage_dng
            
        }
        //  Here, you're using the provided, encoded image as a key to the decompressed image. This way, any time you finish created a decompressed JPEG, you make sure to tuck it away in the cache just in case you need it later.
        
        
        return nil
    }
}

// 对压缩图片， 解压缩的 过程，做了一个缓存。


// 我还以为，是 对图片下载做缓存。  已下载的 图片， 不用重复下载。





extension AsyncImageView{
    struct Static {
        static var cache = NSCache< AnyObject, AnyObject >()
    }
    
 // The only trouble is that you can't actually add static properties to classes. Luckily, you can add them to Structs, which means you just need to get a little creative.
    
    
    
    
    // 类变量
    class var globalCache: NSCache< AnyObject, AnyObject >{
        get {   return Static.cache   }
        
        set {   Static.cache = newValue    }
        //  Usually, shared global state is bad for a couple reasons, a big one being race conditions, but in this case NSCache is already thread-safe thanks to Apple, so you really don't have to worry too much about it.

        //  资源竞争
        //  多线程的 不安全
        
    }
    
}







/*
 
 The tl;dr is that NSCache is basically an NSDictionary that automatically clears itself out when your app receives a memory warning. Since these decoded jpegs are pretty big, and also disposeable, NSCache provides the perfect holder.

 
 */








