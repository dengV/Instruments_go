

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




/*
 
 
 https://developer.apple.com/library/content/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html
 
 
 
 
 Filters
 CICategoryBlur
 CIBoxBlur
 CIDiscBlur
 CIGaussianBlur
 CIMaskedVariableBlur
 CIMedianFilter
 CIMotionBlur
 CINoiseReduction
 CIZoomBlur
 CICategoryColorAdjustment
 CIColorClamp
 CIColorControls
 CIColorMatrix
 CIColorPolynomial
 CIExposureAdjust
 CIGammaAdjust
 CIHueAdjust
 CILinearToSRGBToneCurve
 CISRGBToneCurveToLinear
 CITemperatureAndTint
 CIToneCurve
 CIVibrance
 CIWhitePointAdjust
 CICategoryColorEffect
 CIColorCrossPolynomial
 CIColorCube
 CIColorCubeWithColorSpace
 CIColorInvert
 CIColorMap
 CIColorMonochrome
 CIColorPosterize
 CIFalseColor
 CIMaskToAlpha
 CIMaximumComponent
 CIMinimumComponent
 CIPhotoEffectChrome
 CIPhotoEffectFade
 CIPhotoEffectInstant
 CIPhotoEffectMono
 CIPhotoEffectNoir
 CIPhotoEffectProcess
 CIPhotoEffectTonal
 CIPhotoEffectTransfer
 CISepiaTone
 CIVignette
 CIVignetteEffect
 CICategoryCompositeOperation
 CIAdditionCompositing
 CIColorBlendMode
 CIColorBurnBlendMode
 CIColorDodgeBlendMode
 CIDarkenBlendMode
 CIDifferenceBlendMode
 CIDivideBlendMode
 CIExclusionBlendMode
 CIHardLightBlendMode
 CIHueBlendMode
 CILightenBlendMode
 CILinearBurnBlendMode
 CILinearDodgeBlendMode
 CILuminosityBlendMode
 CIMaximumCompositing
 CIMinimumCompositing
 CIMultiplyBlendMode
 CIMultiplyCompositing
 CIOverlayBlendMode
 CIPinLightBlendMode
 CISaturationBlendMode
 CIScreenBlendMode
 CISoftLightBlendMode
 CISourceAtopCompositing
 CISourceInCompositing
 CISourceOutCompositing
 CISourceOverCompositing
 CISubtractBlendMode
 CICategoryDistortionEffect
 CIBumpDistortion
 CIBumpDistortionLinear
 CICircleSplashDistortion
 CICircularWrap
 CIDroste
 CIDisplacementDistortion
 CIGlassDistortion
 CIGlassLozenge
 CIHoleDistortion
 CILightTunnel
 CIPinchDistortion
 CIStretchCrop
 CITorusLensDistortion
 CITwirlDistortion
 CIVortexDistortion
 CICategoryGenerator
 CIAztecCodeGenerator
 CICheckerboardGenerator
 CICode128BarcodeGenerator
 CIConstantColorGenerator
 CILenticularHaloGenerator
 CIPDF417BarcodeGenerator
 CIQRCodeGenerator
 CIRandomGenerator
 CIStarShineGenerator
 CIStripesGenerator
 CISunbeamsGenerator
 CICategoryGeometryAdjustment
 CIAffineTransform
 CICrop
 CILanczosScaleTransform
 CIPerspectiveCorrection
 CIPerspectiveTransform
 CIPerspectiveTransformWithExtent
 CIStraightenFilter
 CICategoryGradient
 CIGaussianGradient
 CILinearGradient
 CIRadialGradient
 CISmoothLinearGradient
 CICategoryHalftoneEffect
 CICircularScreen
 CICMYKHalftone
 CIDotScreen
 CIHatchedScreen
 CILineScreen
 CICategoryReduction
 CIAreaAverage
 CIAreaHistogram
 CIRowAverage
 CIColumnAverage
 CIHistogramDisplayFilter
 CIAreaMaximum
 CIAreaMinimum
 CIAreaMaximumAlpha
 CIAreaMinimumAlpha
 CICategorySharpen
 CISharpenLuminance
 CIUnsharpMask
 CICategoryStylize
 CIBlendWithAlphaMask
 CIBlendWithMask
 CIBloom
 CIComicEffect
 CIConvolution3X3
 CIConvolution5X5
 CIConvolution7X7
 CIConvolution9Horizontal
 CIConvolution9Vertical
 CICrystallize
 CIDepthOfField
 CIEdges
 CIEdgeWork
 CIGloom
 CIHeightFieldFromMask
 CIHexagonalPixellate
 CIHighlightShadowAdjust
 CILineOverlay
 CIPixellate
 CIPointillize
 CIShadedMaterial
 CISpotColor
 CISpotLight
 CICategoryTileEffect
 CIAffineClamp
 CIAffineTile
 CIEightfoldReflectedTile
 CIFourfoldReflectedTile
 CIFourfoldRotatedTile
 CIFourfoldTranslatedTile
 CIGlideReflectedTile
 CIKaleidoscope
 CIOpTile
 CIParallelogramTile
 CIPerspectiveTile
 CISixfoldReflectedTile
 CISixfoldRotatedTile
 CITriangleKaleidoscope
 CITriangleTile
 CITwelvefoldReflectedTile
 CICategoryTransition
 CIAccordionFoldTransition
 CIBarsSwipeTransition
 CICopyMachineTransition
 CIDisintegrateWithMaskTransition
 CIDissolveTransition
 CIFlashTransition
 CIModTransition
 CIPageCurlTransition
 CIPageCurlWithShadowTransition
 CIRippleTransition
 CISwipeTransition
 
 */
