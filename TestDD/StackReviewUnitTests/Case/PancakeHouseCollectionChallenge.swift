//
//  PancakeHouseCollectionChallenge.swift
//  StackReviewUnitTests
//
//  Created by dengjiangzhou on 2018/4/13.
//  Copyright © 2018年 Razeware. All rights reserved.
//

import XCTest


@testable import StackReview

class PancakeHouseCollectionChallenge: XCTestCase{
    
    var collection: PancakeHouseCollection!
    // Given
    let dict: [String: Any] = [ "name": "Test Pancake House",
                                "priceGuide": 1,
                                "rating": 1,
                                "details": "Test"
    ]
    var addPanceke: PancakeHouse!
    var count = 0
    
    override func setUp() {
        super.setUp()
        
        // when,  testAddPancakeHouseMethod
        addPanceke = PancakeHouse(dictionary: dict)
        collection = PancakeHouseCollection()
        let bundle = Bundle(for: PancakeHouseCollectionTests.self)
        collection.loadPancakeHouses("test_pancake_houses", in: bundle)
        
        count = collection.count
    }
    
    func testAddPancakeHouseMethod(){
        // then
        
        collection.addPancakeHouse(addPanceke! )
        XCTAssert(collection.count == count + 1, " addPancakeHouse 不 是个 好方法")
        
        //  推荐
        XCTAssertTrue(collection._pancakeHouses.contains(addPanceke), "没 添加 进去")
        /*
         
         确实是 可以访问 内部变量 （私有 变量）
         
         */
    }
    
    func testRemovePancakeHouse(){
        let deletePanceke = collection[0];
        
        do {
            try collection.removePancakeHouse(deletePanceke)
        } catch PancakseHouseError.triedToRemoveUnknownPancakeHouse {
            
            print("triedToRemoveUnknownPancakeHouse")
        }catch PancakseHouseError.triedToRemoveFavoritePancakeHouse{
            print("triedToRemoveFavoritePancakeHouse")
            
        }catch{
            XCTAssert(collection.count == count - 1, " removePancakeHouse 是不个 好方法")
        }
        
        let reDeletePanceke = collection[0];
        try! collection.removePancakeHouse(reDeletePanceke)
        XCTAssertFalse(collection._pancakeHouses.contains(reDeletePanceke), "没能够 移除")
    }


}

















