 

import UIKit

public class ProductDetailsViewController: UIViewController {
  
  // MARK: - Injections
  public var product: Product!
  
  // MARK: - Outlets
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var priceLabel: UILabel!
  
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    descriptionLabel.text = product.productDescription
    
    let numberFormatter = NumberFormatter()
    numberFormatter.locale = Locale(identifier: "en_US")
    numberFormatter.numberStyle = .currency
    
    if product.priceHourly > 0 {
      let price = numberFormatter.string(from: product.priceHourly as NSNumber)!
      priceLabel.text = "Only \(price) / hour"
      
    } else if product.priceSquareFoot > 0 {
      let price500SqFt = product.priceSquareFoot * 500
      let price = numberFormatter.string(from: price500SqFt as NSNumber)!
      priceLabel.text = "\(price) / 500 ft²"
    } else {
      priceLabel.text = "Contact Us For Pricing"
    }
    descriptionLabel.text = product.productDescription
  }
  
  // MARK: - Actions
  
  @IBAction func makeReservationPressed(_ sender: Any) {
    
  }
}
