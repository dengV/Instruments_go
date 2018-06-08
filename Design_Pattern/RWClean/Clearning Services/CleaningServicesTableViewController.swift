 

import UIKit

public class CleaningServicesTableViewController: UITableViewController {
  
    private struct SegueIdentifiers{
        static let business = "Business"
        static let home = "Home"
    }   //   新加的
    
    
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()

    tableView.tableFooterView = UIView()
  }  
  
  // MARK: - UITableViewDelegate  
  public override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
    
    
    
     // MARK: Navi  - Segue
    
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? ProductsViewController
            else {  return  }
        
        
        if segue.identifier == SegueIdentifiers.business {
            viewController.productControllerOption = .business
        }
        else if segue.identifier == SegueIdentifiers.home {
            viewController.productControllerOption = .home
        }
        else{
            fatalError("Unknown ProductsViewController segue identifier: " + "\(String(describing: segue.identifier))")
        }
        
    }
    
    
    
    
    
    
}
