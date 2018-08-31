 

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
    productViewModel.configure(self)
    title = "Details: \(productViewModel.titleText)"
  }
  
  // MARK: - Actions
  
  @IBAction func makeReservationPressed(_ sender: Any) {
    
  }
}
 
 
 
 extension ProductDetailsViewController: ProductViewModelView{
    public var productImageView: UIImageView{
        return imageView
    }
    
    public var productPriceLabel: UILabel{
        return priceLabel
    }
    
    public var productDescriptionLabel: UILabel{
        return descriptionLabel
    }
    
 }
