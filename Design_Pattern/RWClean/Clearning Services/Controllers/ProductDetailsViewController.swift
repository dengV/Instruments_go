 

import UIKit

public class ProductDetailsViewController: UIViewController {
  
  // MARK: - Injections
  public var productViewModel: ProductViewModel!
  
  // MARK: - Outlets
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var priceLabel: UILabel!
  
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    descriptionLabel.text = productViewModel.descriptionText
    imageView.rw_setImage(url: productViewModel.imageURL)
    priceLabel.text = productViewModel.priceText
    title = "Details: \(productViewModel.titleText)"
  }
  
  // MARK: - Actions
  
  @IBAction func makeReservationPressed(_ sender: Any) {
    
  }
}
