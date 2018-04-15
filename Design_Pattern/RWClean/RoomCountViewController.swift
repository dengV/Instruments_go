 

import UIKit

public class RoomCountViewController: HomeInfoViewController {
  
  // MARK: - Instance Properties
  internal var initialCount: UInt {
    return 0
  }
  
  internal var count: UInt {
    get {
      return _count
    } set {
      _count = newValue
      label.text = "\(newValue)"
    }
  }
  
  private var _count: UInt = 0
  
  // MARK: - Outlets
  @IBOutlet final internal var label: UILabel!
  @IBOutlet final internal var stepper: UIStepper!  
  
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupCount()
  }
  
  private func setupCount() {
    count = initialCount
    stepper.value = Double(initialCount)
  }
  
  // MARK: - Actions
  @IBAction final internal func stepperValueChanged(_ sender: UIStepper) {
    self.count = UInt(sender.value)
  }
}
