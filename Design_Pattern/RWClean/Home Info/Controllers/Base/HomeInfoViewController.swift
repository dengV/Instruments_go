 

import UIKit

public protocol HomeInfoBuilderDelegate: class {
  func homeInfoBuilderCompleted(_ homeInfo: HomeInfo)
}

public class HomeInfoViewController: UIViewController {
  
  // MARK: - Injections
  public var delegate: HomeInfoBuilderDelegate!
  public var homeInfo: MutableHomeInfo!
  
  // MARK: - Outlets
  @IBOutlet public var imageView: UIImageView?
  @IBOutlet public var nextButton: UIButton?
  
  
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupBackBarButtonItem()
  }
  
  private func setupBackBarButtonItem() {
    let back = NSLocalizedString("Back", comment: "")
    navigationItem.backBarButtonItem = UIBarButtonItem(title: back, style: .plain,
                                                         target: nil, action: nil)
  }
  
  // MARK: - Segues
  public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let HomeInfoViewController = segue.destination as? HomeInfoViewController else { return }
    HomeInfoViewController.delegate = delegate
    HomeInfoViewController.homeInfo = homeInfo
  }
}
