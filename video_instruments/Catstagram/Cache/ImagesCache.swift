//
//  ImagesCache.swift
//  Catstagram
//
//  Created by dengjiangzhou on 2018/5/18.
//  Copyright © 2018年 Luke Parham. All rights reserved.
//

import UIKit


// let imagesCache = NSCache<NSString, UIImage>()
// 就是要用 单例， 就是要用 全局

// 尼玛的， 为什么 没有 写入磁盘


var imagesCache = NSCache<NSString, UIImage>()          // 他妈的， 每次重启， cache 都初始化了， 怎么破

class ImagesCache: NSObject {

//    let imagesCache = NSCache<NSString, UIImage>()  // 局部变量是个 渣渣
    
    class func parseImage(_ keyStr: String, imageUrl: URL, completionHandler: @escaping (_ img: UIImage) -> Void ) {
        
   
        if let img = imagesCache.object(forKey: keyStr as NSString){
            completionHandler(img)
        }
        else{
            UIImage.downloadImage(for: imageUrl) { (image) in
                completionHandler(image!)
                imagesCache.setObject(image!, forKey: keyStr as NSString)
            }
        }
    }
    
    
    
    
}
