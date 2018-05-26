//
//  ViewController.swift
//  Catstagram-Starter
//
//  Created by Luke Parham on 2/9/17.
//  Copyright © 2017 Luke Parham. All rights reserved.
//

import UIKit

class CatFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let kCatCellIdentifier = "CatCell"
    private let screensFromBottomToLoadMoreCats: CGFloat = 2.5
    
    private var photoFeed: PhotoFeedModel?
    private let tableView = UITableView(frame: CGRect.zero, style: .plain)
    private let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Catstagram"
        
        tableView.autoresizingMask = UIViewAutoresizing.flexibleWidth;
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoFeed = PhotoFeedModel(imageSize: imageSizeForScreenWidth())
        view.backgroundColor = .white

        refreshFeed()

        view.addSubview(tableView)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(CatPhotoTableViewCell.classForCoder(), forCellReuseIdentifier: kCatCellIdentifier)
        
        tableView.addSubview(activityIndicatorView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        activityIndicatorView.center = CGPoint(x: view.bounds.size.width/2.0, y: view.bounds.size.height/2.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func refreshFeed() {
        guard let photoFeed = photoFeed else { return }
        
        activityIndicatorView.startAnimating()
        photoFeed.refreshFeed(with: 4) { (photoModels) in
            self.activityIndicatorView.stopAnimating()
            self.insert(newRows: photoModels)
            self.requestComments(forPhotos: photoModels)
            self.loadPage()
        }
    }
    
    func loadPage() {
        guard let photoFeed = photoFeed else { return }

        photoFeed.requestPage(with: 20) { (photoModels) in
            self.insert(newRows: photoModels)
            self.requestComments(forPhotos: photoModels)
        }
    }
    
    func insert(newRows photoModels: [PhotoModel]) {
        guard let photoFeed = photoFeed else { return }

        var indexPaths = [IndexPath]()
        
        let newTotal = photoFeed.numberOfItemsInFeed()
        for i in (newTotal - photoModels.count)..<newTotal {
            indexPaths.append(IndexPath(row: i, section: 0))
        }
        tableView.insertRows(at: indexPaths, with: .none)
    }
    
    func requestComments(forPhotos photoModels: [PhotoModel]) {
        guard let photoFeed = photoFeed else { return }

        for photoModel in photoModels {
            photoModel.commentFeed.refreshFeed(with: { (commentModels) in
                let rowNum = photoFeed.index(of: photoModel)
                let indexPath = IndexPath(row: rowNum, section: 0)
                if (tableView.cellForRow(at: indexPath) as? CatPhotoTableViewCell) != nil {
                    if let firstCell = tableView.visibleCells.first,
                        let visibleCellPath = tableView.indexPath(for: firstCell) {
                        if indexPath.row < visibleCellPath.row {
                            let width = view.bounds.size.width
                            let commentViewHeight = CommentView.height(forCommentFeed: photoModel.commentFeed, withWidth:width)

                            tableView.contentOffset = CGPoint(x: tableView.contentOffset.x, y: tableView.contentOffset.y + commentViewHeight)
                        }
                    }
                }
            })
        }
    }
    
    //MARK: Table View Delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCatCellIdentifier, for: indexPath) as! CatPhotoTableViewCell

        tableView.backgroundColor = .lightGray
        
        cell.updateCell(with: photoFeed?.object(at: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let photoModel = photoFeed?.object(at: indexPath.row) {
            return CatPhotoTableViewCell.height(forPhoto: photoModel, with: view.bounds.size.width)
        }
        return 0
    }
    
    //MARK: Table View DataSource
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoFeed?.numberOfItemsInFeed() ?? 0
    }

    //MARK: Scroll View Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let screensFromBottom = (scrollView.contentSize.height - scrollView.contentOffset.y)/UIScreen.main.bounds.size.height;
        
        if screensFromBottom < screensFromBottomToLoadMoreCats {
            loadPage()
        }
    }
    
    //MARK: Helpers
    func imageSizeForScreenWidth() -> CGSize {
        let screenRect = UIScreen.main.bounds
        let scale = UIScreen.main.scale
        
        return CGSize(width: screenRect.width * scale, height: screenRect.width * scale)
    }
    
    func resetAllData() {
        photoFeed?.clearFeed()
        tableView.reloadData()
        refreshFeed()
    }
}

