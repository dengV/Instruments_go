//
//  HomeInfoBuilder.swift
//  RWClean
//
//  Created by dengjiangzhou on 2018/4/15.
//  Copyright © 2018年 Razeware, LLC. All rights reserved.
//

import Foundation

import UIKit


public class HomeInfoBuilder{
    
    public class func instantiateNavigationController(homeDelegate delegate: HomeInfoBuilderDelegate) -> UINavigationController{
        
        let bundle = Bundle(for: self)
        let storyboard = UIStoryboard(name: "HomeInfoBuilder", bundle: bundle)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let viewController = navigationController.topViewController as! HomeInfoViewController
        viewController.delegate = delegate
        viewController.homeInfo = MutableHomeInfo()
        return navigationController
    }
    
    
    
    
}
