//
//  ImagesCache.swift
//  Catstagram
//
//  Created by dengjiangzhou on 2018/5/18.
//  Copyright © 2018年 Luke Parham. All rights reserved.
//

import UIKit

class ImagesCache: NSObject {

    let imagesCache = NSCache<String, UIImage>()
    
    func parseImage(_ urlString: String, completionHandler: @escaping (_ img: UIImage) -> Void ) {
        
        let imageUrl = URL(string: urlString)
   
        if let img =
        
        
        UIImage.downloadImage(for: imageUrl) { (image) in
        
            
            
            
            
        }
    }
    
    
    
    
}
