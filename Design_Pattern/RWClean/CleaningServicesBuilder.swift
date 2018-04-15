//
//  CleaningServicesBuilder.swift
//  RWClean
//
//  Created by dengjiangzhou on 2018/4/15.
//  Copyright © 2018年 Razeware, LLC. All rights reserved.
//

import Foundation
import UIKit


public class CleaningServicesBuilder{


    public class func instantiateNavigationController() -> UINavigationController{
        
        let bundle = Bundle(for: self)
        let storyboard = UIStoryboard(name: "CleaningServices", bundle: bundle)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        return navigationController
    }

}
