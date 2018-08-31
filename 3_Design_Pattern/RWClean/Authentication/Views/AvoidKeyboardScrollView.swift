 

import UIKit

 // AvoidKeyboardScrollView is just
 // a scroll view subclass
 // taht simply avoids the keyboard
 // whenever it is shown.
 
 

public class AvoidKeyboardScrollView: UIScrollView {
  
  // MARK: - Injections
  internal let notificationCenter = NotificationCenter.default
  
  // MARK: - Instance Properties
  private var originalContentInset: UIEdgeInsets!
    
  // MARK: - Object Lifecycle
  public override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  internal func commonInit() {
    registerForKeyboardNotifications()
    originalContentInset = contentInset
  }
  
  deinit {
    notificationCenter.removeObserver(self)
  }
  
  // MARK: - Keyboard Notifications
  
  private func registerForKeyboardNotifications() {
    
    notificationCenter.addObserver(self, selector: #selector(keyboardWillShown(_:)),
                                   name: .UIKeyboardWillShow, object: nil)
    
    notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(_:)),
                                   name: .UIKeyboardWillHide, object: nil)
    
  }
  
    
  @objc private func keyboardWillShown(_ notification: NSNotification) {
    
    let info = notification.userInfo!
    let kbSize = (info[UIKeyboardFrameEndUserInfoKey] as! CGRect).size
    
    contentInset = UIEdgeInsets(top: originalContentInset.top,
                                left: originalContentInset.left,
                                bottom: originalContentInset.bottom + kbSize.height,
                                right: originalContentInset.right)
    
    animateSetContentInset(contentInset, info: info)
  }
  
    
  @objc private func keyboardWillHide(_ notification: NSNotification) {
    
    let info = notification.userInfo!
    animateSetContentInset(originalContentInset, info: info)
  }
  
    
  private func animateSetContentInset(_ value: UIEdgeInsets, info: [AnyHashable: Any]) {
    
    UIView.beginAnimations(nil, context: nil)
    UIView.setAnimationDuration(info[UIKeyboardAnimationDurationUserInfoKey] as! Double)
    UIView.setAnimationCurve(UIViewAnimationCurve(rawValue: info[UIKeyboardAnimationCurveUserInfoKey] as! Int)!)
    UIView.setAnimationBeginsFromCurrentState(true)
    contentInset = value
    layoutIfNeeded()
    UIView.commitAnimations()
  }
}
