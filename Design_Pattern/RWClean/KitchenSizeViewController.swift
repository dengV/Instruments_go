 

import UIKit

public class KitchenSizeViewController: HomeInfoViewController {
  
  // MARK: - Outlets
  @IBOutlet internal var label: UILabel!
  @IBOutlet internal var segmentedControl: UISegmentedControl!  
  
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    label.text = homeInfo.kitchenSize.kitchenSizeDescription
  }
  
  // MARK: - Actions
  @IBAction internal func segmentedControlValueChanged(_ sender: UISegmentedControl) {
    let roomSize = RoomSize(index: sender.selectedSegmentIndex)
    homeInfo.setKitchenSize(roomSize)
    label.text = roomSize.kitchenSizeDescription
  }
}

// MARK: - RoomSize + kitchenSizeDescription
extension RoomSize {
  
  public var kitchenSizeDescription: String {
    
    switch self {
    case .small: return NSLocalizedString("A smaller-than-average kitchen", comment: "")
    case .medium: return NSLocalizedString("An average-size kitchen", comment: "")
    case .large: return NSLocalizedString("A larger-than-average kitchen", comment: "")
    }
  }
}
