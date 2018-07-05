 

import UIKit

// wocao , 有意思
extension UIViewController {
  
  private struct AssociationKey {
    static var loadingHUD = "rw_loadingHUD"
  }
  
  public var loadingHUD: UIView? {
    get {
      return objc_getAssociatedObject(self, &AssociationKey.loadingHUD) as? UIView
    } set {
      objc_setAssociatedObject(self, &AssociationKey.loadingHUD, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
    
    
  
  public func showLoadingHUD(_ animated: Bool = true) {
    
    guard self.loadingHUD == nil else { return }
    view.isUserInteractionEnabled = false
    
    let loadingHUD = LoadingHUD.instanceFromNib()
    self.loadingHUD = loadingHUD
    view.addSubview(loadingHUD)
    
    loadingHUD.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin]
    loadingHUD.frame.origin.x = (view.frame.width - loadingHUD.frame.width) / 2
    loadingHUD.frame.origin.y = (view.frame.height - loadingHUD.frame.height) / 2
    
    guard animated else { return }
    
    loadingHUD.alpha = 0.0
    UIView.animate(withDuration: 0.33) {
      loadingHUD.alpha = 1.0
    }
    
    // UIActivityIndicatorView 的 alpha 变换 效果， 好神奇
  }
  
    
    
  public func dismissLoadingHUD(_ animated: Bool = true) {
    
    guard let loadingHUD = loadingHUD else { return }
    view.isUserInteractionEnabled = true
    
    let closure: (Bool) -> Void = { [weak self] _ in
      guard let strongSelf = self else { return }
      loadingHUD.removeFromSuperview()
      strongSelf.loadingHUD = nil
    }
    guard animated else {
      closure(true)
      return
    }
    UIView.animate(withDuration: 0.33, animations: {
      loadingHUD.alpha = 0.0      
    }, completion: closure)
  }
}
