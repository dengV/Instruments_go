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

class AboutViewController: UIViewController {

  // MARK: - Outlets
  
  @IBOutlet weak var contentStackView : UIStackView!
  @IBOutlet weak var showHideButton : UIButton!
  @IBOutlet weak var copyrightStackView: UIStackView!
  
  // MARK: - Private Properties
  
  fileprivate var copyrightContentStackView : UIStackView?
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()    
    contentStackView.isLayoutMarginsRelativeArrangement = true
    contentStackView.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
  }

  // MARK: - Actions
  
  @IBAction func handleShowHideTapped(_ sender: AnyObject) {
    if copyrightContentStackView == nil {
      copyrightContentStackView = createCopyrightInfo()
      copyrightContentStackView?.isHidden = true
      copyrightStackView.addArrangedSubview(copyrightContentStackView!)
      UIView.animate(withDuration: 1.0, animations: {
        self.copyrightContentStackView?.isHidden = false
      }) 
      
    } else {
      UIView.animate(withDuration: 1.0, animations: {
          self.copyrightContentStackView?.isHidden = true
        }, completion: { _ in
          self.copyrightContentStackView?.removeFromSuperview()
          self.copyrightContentStackView = nil
      })
    }
  }
  
  fileprivate func createCopyrightInfo() -> UIStackView {
    let logo = UIImage(named: "rw_logo")
    let logoImageView = UIImageView(image: logo)
    
    let copyrightLabel = UILabel(frame: CGRect.zero)
    copyrightLabel.text = "© Razeware 2016"
    
    let axisButton = UIButton(type: .roundedRect)
    axisButton.setTitle("Axis Switch", for: UIControlState())
    axisButton.addTarget(self, action: #selector(switchCopyrightAxis), for: .touchUpInside)
    
    let textStackView = UIStackView(arrangedSubviews: [copyrightLabel, axisButton])
    textStackView.axis = .vertical
    textStackView.spacing = 20.0
    textStackView.alignment = .center
    
    let stackView = UIStackView(arrangedSubviews: [logoImageView, textStackView])
    stackView.axis = .horizontal
    stackView.spacing = 20.0
    stackView.alignment = .center
    stackView.distribution = .equalSpacing
    
    return stackView
  }
  
  @objc fileprivate func switchCopyrightAxis() {
    guard let copyrightContentStackView = copyrightContentStackView else {
      return
    }
    
    let newAxis : UILayoutConstraintAxis
    switch copyrightContentStackView.axis {
    case .horizontal:
      newAxis = .vertical
    case .vertical:
      newAxis = .horizontal
    }
    
    UIView.animate(withDuration: 0.7, animations: {
      copyrightContentStackView.axis = newAxis
    }) 
  }
}
