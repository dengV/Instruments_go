

import UIKit

class ImageCache {
  
  private static let _shared = ImageCache()
  
  var images = [String:UIImage]()
  
  static var shared: ImageCache {
    return _shared
  }
  
  func loadThumbnail(for photo: FlickrPhoto, completion: @escaping FlickrAPI.FetchImageCompletion) {
    
    if let image = ImageCache.shared.image(forKey: photo.id){
        completion(Result.success(image))
    }
    else{
        FlickrAPI.loadImage(for: photo, withSize: "m") { result in
            if case .success(let image) = result {
                ImageCache.shared.set(image, forKey: photo.id)
            }// if case .success(let image) = result
            completion(result)
        }
    }// if let image = ImageCache.shared.image(forKey:
  }
}

// MARK: - Custom Accessors
extension ImageCache {
  
  func set(_ image: UIImage, forKey key: String) {
    images[key] = image
  }
  
  func image(forKey key: String) -> UIImage? {
    return images[key]
  }
}
