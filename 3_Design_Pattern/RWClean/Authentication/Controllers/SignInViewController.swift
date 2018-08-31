 

import UIKit

internal class SignInViewController: UIViewController {
  
  // MARK: - Instance Properties
  internal var delegate: AuthControllerDelegate!
  
  // MARK: - Outlets
  @IBOutlet internal var emailTextField: UITextField!
  @IBOutlet internal var passwordTextField: UITextField!
  
  // MARK: - Class Constructors
  internal class func instanceFromStoryboard(delegate: AuthControllerDelegate) -> UINavigationController {
    let bundle = Bundle(for: self)
    let storyboard = UIStoryboard(name: "Auth", bundle: bundle)
    let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
    
    let viewController = navigationController.topViewController as! SignInViewController
    viewController.delegate = delegate
    
    return navigationController
  }
  
    
  // MARK: - Actions
  @IBAction func cancelButtonPressed(_ sender: Any) {
    delegate.signInCancelled(on: self)
  }
  
  @IBAction func signInButtonPressed(_ sender: Any) {
    attemptSignIn()
  }
  
    
    
  internal func attemptSignIn() {
    guard let email = emailTextField.text, !email.isEmpty,
      let password = passwordTextField.text, !password.isEmpty else {
        showMissingInputAlert()
        return
    }
    
    emailTextField.resignFirstResponder()
    passwordTextField.resignFirstResponder()
    
    showLoadingHUD()
    delegate.signInRequested(on: self, email: email, password: password, failure: handleError())
  }
  
    
  private func showMissingInputAlert() {
    let controller = UIAlertController(title: NSLocalizedString("Missing Email or Password", comment: ""),
                                       message: NSLocalizedString("Please check your inputs and try again", comment: ""),
                                       preferredStyle: .alert)
    
    controller.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: ""),
                                       style: .default))
    
    present(controller, animated: true)
  }
  
    
  private func handleError() -> (SignInError) -> Void {
    return { [weak self] in
      guard let strongSelf = self else { return }
      
      strongSelf.dismissLoadingHUD()
      
      switch $0 {
      case .invalidCredentials: strongSelf.showInvalidCredentialsAlert()
      default: strongSelf.showCheckInternetConnectionAlert()
      }
    }
  }
  
  private func showInvalidCredentialsAlert() {
    
    let controller = UIAlertController(title: NSLocalizedString("Incorrect Email or Password", comment: ""),
                                       message: NSLocalizedString("Please verify your inputs and try again", comment: ""),
                                       preferredStyle: .alert)
    
    controller.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: ""),
                                       style: .default))
    
    present(controller, animated: true)
  }
  
  private func showCheckInternetConnectionAlert() {
    
    let controller = UIAlertController(title: NSLocalizedString("Networking Error", comment: ""),
                                       message: NSLocalizedString("Please check your internet connection and try again", comment: ""),
                                       preferredStyle: .alert)
    
    let retry = UIAlertAction(title: NSLocalizedString("Retry", comment: ""), style: .default) { [weak self] _ in
      self?.attemptSignIn()
    }
    let cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel)
    
    controller.addAction(retry)
    controller.addAction(cancel)
    
    present(controller, animated: true)
  }
  
  // MARK: - Segues
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let viewController = segue.destination as? RegisterViewController else { return }
    
    viewController.delegate = delegate
  }
}


// MARK: - UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate {
  
  public  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == emailTextField {
      passwordTextField.becomeFirstResponder()
    } else {
      textField.resignFirstResponder()
    }
    
    return false
  }
}
