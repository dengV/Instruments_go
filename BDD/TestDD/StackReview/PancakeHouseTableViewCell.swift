 

import UIKit

public class PancakeHouseTableViewCell: UITableViewCell {

  // MARK: - Outlets
  
  @IBOutlet public weak var nameLabel: UILabel!
  @IBOutlet public weak var pancakeImage : UIImageView!
  @IBOutlet public weak var ratingImage: UIImageView!
  
  // MARK: - Instance Properties
  
  public var pancakeHouse : PancakeHouse? {
    didSet {
      guard let pancakeHouse = pancakeHouse else { return }
      nameLabel.text = pancakeHouse.name
      pancakeImage.image = pancakeHouse.thumbnail ?? UIImage(named: "placeholder_thumb")
      ratingImage.image = pancakeHouse.rating.smallRatingImage
    }
  }
}
