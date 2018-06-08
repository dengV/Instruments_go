//
//  ProductsViewController.swift
//  RWClean
//
//  Created by dengjiangzhou on 2018/5/10.
//  Copyright © 2018年 Razeware, LLC. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {

    
    
    
    // MARK: - Injections
    
    internal var networkClient = NetworkClient.shared       //  First we get the network client shared instance.
    
    //   新加的
    internal var productControllerOption: Product.ProductType!{
        didSet{
            title = productControllerOption.title
        }
    }
/*
     
     internal var productType: Product.ProductType! {
     didSet {
     title = productType.title
     }
     }

     */
    
    
    // MARK: - Instance Properties
    internal var imageTasks: [IndexPath: URLSessionDataTask] = [:]
    internal var productViewModels: [ProductViewModel] = []
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
        
        networkClient.getProducts(forType: productControllerOption, success: { [weak self] products in
            guard let strongSelf = self else { return }
            strongSelf.productViewModels = products.map{ ProductViewModel(product: $0) }
            strongSelf.collectionView.refreshControl?.endRefreshing()
            strongSelf.collectionView.reloadData()
        }) { [weak self] error in
            guard let strongSelf = self else { return }
            strongSelf.collectionView.refreshControl?.endRefreshing()
            print("Product download failed: \(error)")
        }
        
    }
    
    
    
    // MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        loadProducts()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        guard let selectedItem = collectionView.indexPathsForSelectedItems else { return }
        selectedItem.forEach{ collectionView.deselectItem(at: $0, animated: false) }
    }
    
    // MARK: - Segue
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? ProductDetailsViewController else { return }
        let indexPath = collectionView.indexPathsForSelectedItems!.first!
        viewController.productViewModel = productViewModels[indexPath.row]
        
    }
}



// MARK: - UICollectionViewDataSource
extension ProductsViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productViewModels.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "ProductCell"
        
        let productViewModel = productViewModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                      for: indexPath) as! ProductCollectionViewCell
        cell.label.text = productViewModel.titleText
        cell.imageView.rw_setImage(url: productViewModel.imageURL)
        
        return cell
    }
}



//  let url = URL(string: "https://rwcleanbackend.herokuapp.com/products/home")!

