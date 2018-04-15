 

import UIKit

public class HomeSquareFootageViewController: HomeInfoViewController {
  
  // MARK: - Instance Properties
  internal lazy var numberFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    return numberFormatter
  }()
  
  internal var squareFeet: UInt {
    get {
      return _squareFeet
    } set {
      _squareFeet = newValue
      homeInfo.setSquareFootage(newValue)
      label.text = numberFormatter.string(from: newValue as NSNumber)
      guard slider.value == slider.maximumValue else { return }
      label.text! += "+"
    }
  }
  private var _squareFeet: UInt = 0
  
  private let sliderSqFtMultiplier: Float = 500
  
  // MARK: - Outlets
  @IBOutlet internal var label: UILabel!
  @IBOutlet internal var slider: UISlider!  
  
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupSquareFootage()
  }
  
  private func setupSquareFootage() {
    squareFeet = homeInfo.squareFootage
    slider.value = Float(homeInfo.squareFootage) / sliderSqFtMultiplier
  }
  
  // MARK: - Actions
  @IBAction func sliderValueChanged(_ sender: UISlider) {
    let value = roundf(sender.value)
    squareFeet = UInt(value * sliderSqFtMultiplier)
  }
}
