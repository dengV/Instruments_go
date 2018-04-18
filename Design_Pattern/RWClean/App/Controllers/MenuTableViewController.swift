 

import UIKit

public class MenuTableViewController: UITableViewController {
  
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    configureBackButton()
    configureTableView()
  }
  
  private func configureBackButton() {
    let image = UIImage(named: "menu")!
    let backButton = UIBarButtonItem(image: image, style: .done, target: nil, action: nil)
    navigationItem.backBarButtonItem = backButton
    navigationItem.backBarButtonItem = backButton
  }
  
  private func configureTableView() {
    tableView.tableFooterView = UIView()
  }
  
  // MARK: - UITableViewDelegate
  private struct CellIdentifiers  {
    static let products = "ProductsCell"
    static let homeInfo = "HomeInfoCell"
  }
  
  public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let cellIdentifier = tableView.cellForRow(at: indexPath)?.reuseIdentifier else { return }
    switch cellIdentifier {
    case CellIdentifiers.products:
        showCleaningServicesController()
    case CellIdentifiers.homeInfo:
        showHomeInfoController()
    default: break
    }
  }
  
  fileprivate func showCleaningServicesController() {

    let viewController = CleaningServicesBuilder.instantiateNavigationController()
    splitViewController!.showDetailViewController(viewController, sender: nil)
  }
  
  fileprivate func showHomeInfoController() {
    
    
    let viewController = HomeInfoBuilder.instantiateNavigationController(homeDelegate: self).topViewController
    splitViewController!.showDetailViewController(viewController!, sender: nil)
  }
}

// MARK: - HomeInfoBuilderDelegate
extension MenuTableViewController: HomeInfoBuilderDelegate {
    
  public func homeInfoBuilderCompleted(_ homeInfo: HomeInfo) {    
    navigationController?.viewControllers = [self]
    showCleaningServicesController()
  }
}
