 

import UIKit


public final class SetNavigationRootSegue: UIStoryboardSegue {

  public override func perform() {
    source.navigationController!.setViewControllers([destination], animated: true)
  }
}
