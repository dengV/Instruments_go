

import UIKit

extension UIImage {
  
  func applyTonalFilter() -> UIImage? {
    let context = CIContext(options:nil)
    let filter = CIFilter(name:"CIPhotoEffectTonal")
    let input = CoreImage.CIImage(image: self)
    filter?.setValue(input, forKey: kCIInputImageKey)
    let outputImage = filter?.outputImage
    
    let outImage = context.createCGImage(outputImage!, from: outputImage!.extent)
    let returnImage = UIImage(cgImage: outImage!)
    return returnImage
  }
}
