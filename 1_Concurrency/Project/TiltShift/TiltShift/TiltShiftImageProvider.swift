 

import UIKit

class TiltShiftImageProvider {
  
  let tiltShiftImage: TiltShiftImage
  
  init(tiltShiftImage: TiltShiftImage) {
    self.tiltShiftImage = tiltShiftImage
  }
  
  var image: UIImage? {
    let url = Bundle.main.url(forResource: tiltShiftImage.imageName, withExtension: "compressed")!
    
    guard let rawData = NetworkSimulator.syncLoadDataAtURL(url),
      let decompressedData = Compressor.decompressData(rawData),
      let inputImage = UIImage(data: decompressedData) else { return .none }
    
    let mask = topAndBottomGradient(inputImage.size)
    return inputImage.applyBlurWithRadius(5, maskImage: mask)
  }
  
}

extension TiltShiftImageProvider: Hashable {
  var hashValue: Int {
    return (tiltShiftImage.title + tiltShiftImage.imageName).hashValue
  }
}

func ==(lhs: TiltShiftImageProvider, rhs: TiltShiftImageProvider) -> Bool {
  return lhs.tiltShiftImage == rhs.tiltShiftImage
}

