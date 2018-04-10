

import UIKit

public class BaseDetailViewController: UIViewController {
  
  // MARK: - Object Lifecycle
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setUpNavigationItem()
  }
  
  fileprivate func setUpNavigationItem() {
    navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
    navigationItem.leftItemsSupplementBackButton = true
  }
}
