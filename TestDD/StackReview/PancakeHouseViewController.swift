

import UIKit
import MapKit

public class PancakeHouseViewController : BaseDetailViewController {
  
  // MARK: - Outlets
  
  @IBOutlet public weak var detailsLabel: UILabel!
  @IBOutlet public weak var imageView: UIImageView!
  @IBOutlet public weak var mapView: MKMapView!
  @IBOutlet public weak var nameLabel: UILabel!
  @IBOutlet public weak var priceGuideLabel: UILabel!
  @IBOutlet public weak var ratingImage: UIImageView!
  

  // MARK: - Instance Properties
  
  public var pancakeHouse : PancakeHouse? {
    didSet {
      configureView()
    }
  }
  
  // MARK: - View Lifecycle
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }
  
  func configureView() {
    guard let pancakeHouse = pancakeHouse, isViewLoaded else { return }
    nameLabel.text = pancakeHouse.name
    imageView.image = pancakeHouse.photo ?? UIImage(named: "placeholder")
    detailsLabel.text = pancakeHouse.details
    priceGuideLabel.text = "\(pancakeHouse.priceGuide)"
    ratingImage.image = pancakeHouse.rating.ratingImage
    centreMap(mapView, atPosition: pancakeHouse.location)
  }
  
  fileprivate func centreMap(_ map: MKMapView?, atPosition position: CLLocationCoordinate2D?) {
    guard let map = map,
      let position = position else {
        return
    }
    map.isZoomEnabled = false
    map.isScrollEnabled = false
    map.isPitchEnabled = false
    map.isRotateEnabled = false
    
    map.setCenter(position, animated: true)
    
    let zoomRegion = MKCoordinateRegionMakeWithDistance(position, 10000, 10000)
    map.setRegion(zoomRegion, animated: true)
    
    let annotation = MKPointAnnotation()
    annotation.coordinate = position
    map.addAnnotation(annotation)
  }
}
