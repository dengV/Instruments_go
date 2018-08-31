//
//  PancakeHouseCollectionIntegrationTests.swift
//  StackReviewIntegrationTests
//
//  Created by dengjiangzhou on 2018/4/17.
//  Copyright © 2018年 Razeware. All rights reserved.
//

import XCTest


@testable import StackReview


class PancakeHouseCollectionIntegrationTests: XCTestCase {
    
    
    var collectionPancake: PancakeHouseCollection!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        collectionPancake = PancakeHouseCollection()
        
    }
  
    
    
    func testLoadPancakesFromCloudFails(){
        
        // given
        let expectation = self.expectation(description: "Expectation load pancakes from cloud to fail")
        //  So this expectation is actually a method , that is provided by XCTestCase.
        //  Essentially, it sets up an expectation that, at some point, will be fulfilled.
        
        
        
        
        // when
        collectionPancake.loadPancakesFromCloud { (didReceiveData) in
            
            
            //  Inside this closure,  this is where we wanna signal the expectation,
            
            expectation.fulfill()
            XCTAssertFalse(didReceiveData, "Let it pass")
            // and we can also do things , such as write assertions as well.
            
            print("Test integrated.")
        }
        
        
        
        // then
        waitForExpectations(timeout: 3, handler: nil)
        
        // In our then, we actually want to tell it to wait.
        // So then it will wait for this expectation to be signaled.
        
        
        // the handler: , it is optional ,
        // you could provide something. In our cases, we do not need one.
        
     
    }
    /*
     {
     没有 when 条件，
     
     file:///%3Cunknown%3E: test failure: PancakeHouseCollectionIntegrationTests.testLoadPancakesFromCloudFails() failed: Asynchronous wait failed: Exceeded timeout of 3 seconds, with unfulfilled expectations: "Expectation load pancakes from cloud to fail".
     
     }
     
     
     
     {
     没有 when 条件，
     
     just as a means to show that this can fail.
     
     }
     */
    
}

/*
 
 Command + U ,
 
 if you actually run all the tests .
 
 //
 
 click 左边的 navigation bar 的 diamond,
 
 Go over to show the test navigator.
 
 
 
 
 
 
 
 */


