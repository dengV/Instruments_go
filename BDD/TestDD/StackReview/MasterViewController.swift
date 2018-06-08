

import UIKit


// Root 的 split 中的 master 

public class MasterViewController: UITableViewController {
  
  // MARK: - Instance Properties
  
  internal var collection = PancakeHouseCollection()
  
  public override var tableView: UITableView! {
    didSet {
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 100
    }
  }
  
  // MARK: - Object Lifecycle
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    title = "Pancake Houses"
  }
  
  // MARK: - View Lifecycle
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    collection.loadDefaultPancakeHouses()
  }
  
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
  }
  
  // MARK: - Segues
  
  public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    guard let indexPath = tableView.indexPathForSelectedRow,
      let navController = segue.destination as? UINavigationController,
      let controller = navController.topViewController as? PancakeHouseViewController else { return }    
    
    let pancakeHouse = collection[(indexPath as NSIndexPath).row]
    controller.pancakeHouse = pancakeHouse
  }
}

 // MARK: - UITableViewDataSource

extension MasterViewController {

  public override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return collection.count
  }
  
  public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let pancakeHouse = collection[(indexPath as NSIndexPath).row]
    if let cell = cell as? PancakeHouseTableViewCell {
      cell.pancakeHouse = pancakeHouse
    } else {
      cell.textLabel?.text = pancakeHouse.name
    }
    
    return cell
  }
}
