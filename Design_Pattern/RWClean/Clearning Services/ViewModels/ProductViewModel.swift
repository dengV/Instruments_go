//
//  ProductViewModel.swift
//  RWClean
//
//  Created by dengjiangzhou on 2018/6/8.
//  Copyright © 2018年 Razeware, LLC. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol ProductViewModelView{
    @objc optional var productImageView: UIImageView { get }
    @objc optional var productPriceLabel: UILabel { get }
    @objc optional var productDescriptionLabel: UILabel { get }
    
    @objc optional var productTitleLabel: UILabel { get }
}

/*
 Use of undeclared type 'UIImageView'
 这个要 import UIKit
 
 
 'optional' can only be applied to members of an @objc protocol
 */



public final class ProductViewModel{
    
    // MARK:- Static Properties
    
    internal static let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }()
    
    
    // MARK:- Instance Properties
    
    public let product: Product
    fileprivate let descriptionText: String
    fileprivate let imageURL: URL?
    
    fileprivate let priceText: String
    public let titleText: String
    
    // MARK:- Object Lifecycle
    
    public init(product: Product) {
        self.product = product
        descriptionText = product.productDescription
        imageURL = product.imageURL
        
        if product.priceHourly > 0{
            let price = ProductViewModel.numberFormatter.string(from: product.priceHourly as NSNumber)!
            priceText = "Only \(price) / hour"
        }
        else if product.priceSquareFoot > 0 {
            let price500SqFt = product.priceSquareFoot * 500
            let price = ProductViewModel.numberFormatter.string(from: price500SqFt as NSNumber)!
            priceText = "\(price) / 500 ft²"
        }
        else {
            priceText = "Contact Us For Pricing"
        }
        titleText = product.title
    }
    
    
    
    
    
}





extension ProductViewModel{
    // 遵守 ProductViewModelView 协议 的 ， view
    
    public func configure(_ view: ProductViewModelView){
        view.productImageView?.rw_setImage(url: imageURL)
        view.productPriceLabel?.text = priceText
        view.productDescriptionLabel?.text = descriptionText
        
        view.productTitleLabel?.text = titleText
    }
    
}

// Optional , 我好像又一次 ， 看见了 ，向 空对象， 发消息， 啥事没有


// Good Trick



