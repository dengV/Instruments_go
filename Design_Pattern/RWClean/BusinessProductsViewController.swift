 

import UIKit

public class BusinessProductsViewController: UIViewController {
  
  // MARK: - Instance Properties
  internal var imageTasks: [IndexPath: URLSessionDataTask] = [:]
  internal var products: [Product] = []
  internal let session = URLSession.shared
  
  
  // MARK: - Outlets
  @IBOutlet internal var collectionView: UICollectionView! {
    didSet {
      let refreshControl = UIRefreshControl()
      refreshControl.addTarget(self, action: #selector(loadProducts), for: .valueChanged)
      collectionView.refreshControl = refreshControl
      
      let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
      collectionView.collectionViewLayout = CollectionViewCenterFlowLayout(layout: layout)
    }
  }
  
  internal func loadProducts() {
    collectionView.refreshControl?.beginRefreshing()
    let url = URL(string: "https://rwcleanbackend.herokuapp.com/products/business")!
    let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
      if let error = error {
        print("Product download failed: \(error)")
        return
      }
      guard let data = data else {
        print("Product download failed: data is nil!")
        return
      }
      let jsonArray: [[String: Any]]
      do {
        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] else {
          print("Product download failed: invalid JSON")
          return
        }
        jsonArray = jsonObject
        
      } catch {
        print("Product download failed: invalid JSON")
        return
      }
      let products = Product.array(jsonArray: jsonArray)
      DispatchQueue.main.async { [weak self] in
        guard let strongSelf = self else { return }
        strongSelf.products = products
        strongSelf.collectionView.refreshControl?.endRefreshing()
        strongSelf.collectionView.reloadData()
      }
    })
    task.resume()
  }
  
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    loadProducts()
  }
  
  public override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    guard let selectedItem = collectionView.indexPathsForSelectedItems else { return }
    selectedItem.forEach { collectionView.deselectItem(at: $0, animated: false) }
  }
  
  // MARK: - Segue
  public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let viewController = segue.destination as? ProductDetailsViewController else { return }
    let indexPath = collectionView.indexPathsForSelectedItems!.first!
    let product = products[indexPath.row]
    viewController.product = product
  }
}

// MARK: - UICollectionViewDataSource
extension BusinessProductsViewController: UICollectionViewDataSource {
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return products.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellIdentifier = "ProductCell"
    
    let product = products[indexPath.row]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                  for: indexPath) as! ProductCollectionViewCell
    cell.label.text = product.title
    
    imageTasks[indexPath]?.cancel()
    
    if let url = product.imageURL {
      let task = session.dataTask(with: url, completionHandler: { [weak cell]
        (data, response, error) in
        
        if let error = error {
          print("Image download failed: \(error)")
          return
        }
        
        guard let cell = cell,
          let data = data,
          let image = UIImage(data: data) else {
            print("Image download failed: invalid image data!")
            return
        }
        DispatchQueue.main.async { [weak cell] in
          guard let cell = cell else { return }
          cell.imageView.image = image
        }
      })
      imageTasks[indexPath] = task
      task.resume()
    }
    return cell
  }
}
