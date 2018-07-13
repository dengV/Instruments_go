 

import UIKit

class TiltShiftOperation : ImageFilterOperation {
  
  override func main() {
    if isCancelled { return }
    guard let inputImage = filterInput else { return }
    
    if isCancelled { return }
    let mask = topAndBottomGradient(inputImage.size)
    
    if isCancelled { return }
    filterOutput = inputImage.applyBlurWithRadius(5, maskImage: mask)
  }
}
