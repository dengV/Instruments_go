 

import UIKit

// MARK: - WelcomeViewControllerDelegate
public protocol WelcomeViewControllerDelegate: class {
  func welcomeViewControllerDonePressed(_ controller: WelcomeViewController)
}

// MARK: - WelcomeViewController
public class WelcomeViewController: UIViewController {
  
   // MARK: - Injections
  public var delegate: WelcomeViewControllerDelegate?
  
  // MARK: - Instance Properties
  internal let imageNames: [String] = ["mop", "toothbrushing_frog", "towels"]
  internal var index = 0
  internal var timer: Timer?
  
  // MARK: - Outlets
  @IBOutlet internal var imageView: UIImageView!
  
  // MARK: - View Lifecycle
  public override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    timer = Timer.scheduledTimer(timeInterval: 5.0, target: self,
                                 selector: #selector(updateImageView(_:)),
                                 userInfo: nil, repeats: true)
  }
  
  public override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    timer?.invalidate()
  }
  
  internal func updateImageView(_ timer: Timer) {
    index = (index + 1) < imageNames.count ? (index + 1) : 0
    imageView.image = UIImage(named: imageNames[index],
                              in: Bundle(for: type(of: self)),
                              compatibleWith: nil)
  }
    
  // MARK: - Actions
  @IBAction func doneButtonPressed(_ sender: Any) {
    delegate?.welcomeViewControllerDonePressed(self)
  }  
}
