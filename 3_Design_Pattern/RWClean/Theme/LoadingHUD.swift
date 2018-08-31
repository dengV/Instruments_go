 

import UIKit


public final class LoadingHUD: UIView {
  
  public class func instanceFromNib() -> LoadingHUD {
    let bundle = Bundle(for: LoadingHUD.self)
    let nibName = "LoadingHUD"
    let nib = UINib(nibName: nibName, bundle: bundle)
    return nib.instantiate(withOwner: nil, options: nil).last as! LoadingHUD
  }  
}
