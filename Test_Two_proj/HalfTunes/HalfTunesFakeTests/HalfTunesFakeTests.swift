//
//  HalfTunesFakeTests.swift
//  HalfTunesFakeTests
//
//  Created by dengjiangzhou on 2018/5/3.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

import XCTest

@testable import HalfTunes

class HalfTunesFakeTests: XCTestCase {
    
    var controllerUnderTest: SearchViewController!
    
    override func setUp() {
        super.setUp()
        controllerUnderTest = UIStoryboard(name: "main", bundle: nil).instantiateInitialViewController() as! SearchViewController!
    }
    
    override func tearDown() {
        controllerUnderTest = nil
        super.tearDown()
    }
    

    
}
