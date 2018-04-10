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
