//
//  ProductViewModel.swift
//  RWClean
//
//  Created by dengjiangzhou on 2018/6/8.
//  Copyright © 2018年 Razeware, LLC. All rights reserved.
//

import Foundation


//protocol ProductViewModelView {
   // <#requirements#>
//}



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
    public let descriptionText: String
    public let imageURL: URL?
    
    public let priceText: String
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

