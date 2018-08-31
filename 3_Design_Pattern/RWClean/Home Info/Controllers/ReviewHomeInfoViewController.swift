 

import UIKit

// MARK: - ReviewHomeInfoViewController
public class ReviewHomeInfoViewController: HomeInfoViewController {
  
  // MARK: - Instance Properties
  internal var staticTableViewController: ReviewHomeInfoStaticTableViewController!
  
  // MARK: - View Lifecycle
  public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    
    if let viewController = segue.destination as? ReviewHomeInfoStaticTableViewController {
      staticTableViewController = viewController
      staticTableViewController.homeInfo = homeInfo
    } else {
      // TODO: - Write this...
    }
  }
  
  // MARK: - Actions
  @IBAction internal func doneButtonPressed(_ sender: Any) {
    showLoadingHUD()
    // TODO: - Write this...
  }
}

// MARK: - ReviewHomeInfoStaticTableViewController
internal class ReviewHomeInfoStaticTableViewController: UITableViewController {
  
  // MARK: - Injections
  internal var homeInfo: MutableHomeInfo! {
    didSet {
      updateHomeInfoLabels()
    }
  }
  
  // MARK: - Instance Properties
  internal lazy var numberFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    return numberFormatter
  }()
  
  // MARK: - Outlets
  @IBOutlet internal var bathroomCountLabel: UILabel!
  @IBOutlet internal var bedRoomCountLabel: UILabel!
  @IBOutlet internal var otherRoomCountLabel: UILabel!
  @IBOutlet internal var kitchenSizeLabel: UILabel!
  @IBOutlet internal var squareFootageLabel: UILabel!
  
  // MARK: - View Lifecycle
  internal override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    updateHomeInfoLabels()
  }
  
  private func configureTableView() {
    tableView.tableFooterView = UIView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    updateHomeInfoLabels()
  }
  
  internal func updateHomeInfoLabels() {
    guard isViewLoaded else { return }
    bathroomCountLabel.text = "\(homeInfo.bathroomCount)"
    bedRoomCountLabel.text = "\(homeInfo.bedroomCount)"
    otherRoomCountLabel.text = "\(homeInfo.otherRoomsCount)"
    kitchenSizeLabel.text = "\(homeInfo.kitchenSize.displayTitle)"
    squareFootageLabel.text = numberFormatter.string(from: homeInfo.squareFootage as NSNumber)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    parent?.prepare(for: segue, sender: sender)
  }
}
