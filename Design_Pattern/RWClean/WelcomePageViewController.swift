 

import UIKit

public class WelcomePageViewController: UIPageViewController {
  
  // MARK: - Instance Properties
  public let childIdentifiers = ["page1", "page2", "page3"]
  internal lazy var childPages: [UIViewController] = { [unowned self] in
    return self.childIdentifiers.map { identifier in
      return self.storyboard!.instantiateViewController(withIdentifier: identifier)
    }
  }()
  
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupPager()
  }
  
  private func setupPager() {
    dataSource = self
    setViewControllers([childPages.first!], direction: .forward, animated: false, completion: nil)
  }
}

// MARK: - UIPageViewControllerDataSource
extension WelcomePageViewController: UIPageViewControllerDataSource {
  
  public func pageViewController(_ pageViewController: UIPageViewController,
                                 viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let currentIndex = childPages.index(of: viewController), currentIndex > 0 else {
      return nil
    }
    return childPages[currentIndex - 1]
  }
  
  public func pageViewController(_ pageViewController: UIPageViewController,
                                 viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let currentIndex = childPages.index(of: viewController),
      currentIndex < (childPages.count - 1) else { return nil }
    return childPages[currentIndex + 1]
  }
  
  public func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return childPages.count
  }
  
  public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return 0
  }
}
