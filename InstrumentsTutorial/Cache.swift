

import UIKit

class ImageCache {
  
  private static let _shared = ImageCache()
  
  var images = [String:UIImage]()
  
  static var shared: ImageCache {
    return _shared
  }
  
  func loadThumbnail(for photo: FlickrPhoto, completion: @escaping FlickrAPI.FetchImageCompletion) {
    FlickrAPI.loadImage(for: photo, withSize: "m") { result in
      completion(result)
    }
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
