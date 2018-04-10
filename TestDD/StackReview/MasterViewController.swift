/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

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
