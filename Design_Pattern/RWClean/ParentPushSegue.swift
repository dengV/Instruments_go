 

import UIKit

public final class ParentPushSegue: UIStoryboardSegue {
  
  public override func perform() {
    source.navigationController!.pushViewController(destination, animated: true)
  }
}
