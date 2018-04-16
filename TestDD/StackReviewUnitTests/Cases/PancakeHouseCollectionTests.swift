//
//  PancakeHouseCollectionTests.swift
//  StackReviewUnitTests
//
//  Created by dengjiangzhou on 2018/4/10.
//  Copyright © 2018年 Razeware. All rights reserved.
//

import XCTest


@testable import StackReview

/* In order to get access to the Stack Review module.
We need to first import it.
 
 
 using @testable statement,
 So that we can get access to both the interal ,
 along with the public properties and methods.
 
 */



// 跑 测试， Command + U


class PancakeHouseCollectionTests: XCTestCase {
    
    

    var collection: PancakeHouseCollection!
    
    /*
     create a property that will hold onto the instance
     of the collection we will be writing tests for.
     
     
     Just call this collection ,
     and then it is important that you declare the type, and say
     that is force unwrapped.
     
     
     The reason is , we wanna be able to set this within our test methods , and we do not wanna have
     any side effects , so each test method will get will a new instance of the  PancakeHouseCollection
     */
    
    
    
    
    override func setUp() {
        super.setUp()
/*
         the set up method , like we talked about in the slides, is called before each one of these tests is called itself,
         So each test will get a brand new instance of the collection.
         
         And again , that is just to minimize any sort of side effects that the tests may have.
         
         
         we do not want one test to cause another test to either fail or pass .
         
         We wanna try to keep them as independent from each other as possible
         */
        collection = PancakeHouseCollection()
        let bundle = Bundle(for: PancakeHouseCollectionTests.self)
        collection.loadPancakeHouses("test_pancake_houses", in: bundle)
    }
    
    
    
    
    
    
    func testCollectionHasExpectedItemsCount(){
        
        /* 数 plist 文件 的 file 数量的方法。
        is to open files side by side ,
         You can do this by holding down option,
         and then left-cliking on this plist here.
         按住 Alt ， 点击文件 就好了
        */
        
    /*    collection = PancakeHouseCollection()
        let bundle = Bundle(for: PancakeHouseCollectionTests.self)
        collection.loadPancakeHouses("test_pancake_houses", in: bundle)     */
        XCTAssert(collection.count == 3, "Collection did not have expected number of item")

    }
  //    测试 方法， 以 test 开头
    
    
    /*
    func testFirstPancakeHouseHasExpectedValue(){
/*        collection = PancakeHouseCollection()
        let bundle = Bundle(for: PancakeHouseCollectionTests.self)
        collection.loadPancakeHouses("test_pancake_houses", in: bundle)
        //  redundant code
        */
        let pancakeHouse = collection[0]
        /// Use a subscript to get the pancake house at a given index.
        ///
        /// - parameter index: The index
        ///
        /// - returns: The `PancakeHouse` for the `index`
        XCTAssertEqual(pancakeHouse.name, "name 1")
        XCTAssertEqual(pancakeHouse.details, "details 1")
        
        
        XCTAssertEqual(pancakeHouse.photo, UIImage(named: "pancake1"))
/*
         Essentially , the XCTAssertEquals accept any two things
         
         (UIImage)
         
         that are equatable, including optional values
         so if it is nul , and the other side is not nil , it will fail.
         Otherwise it takes care of unwrapping it.
         */
        
    }   // Old
    */
     func testFirstPancakeHouseHasExpectedValue(){
        
        verifyPancakeHouseHasExpectedValues(index: 0)
    }// new
    
    func testSecondPancakeHouseHasExpectedValue(){
        
        verifyPancakeHouseHasExpectedValues(index: 1)
    }
    
    func testThirdPancakeHouseHasExpectedValue(){
        
        verifyPancakeHouseHasExpectedValues(index: 2)
    }
    /* 不推荐 写在 一个方法里面，（ 用 循环之类的）
     
     
     
     推荐， 错误 发生后， 方便找出 in certain cases for certain values.
 
 */
    
    func verifyPancakeHouseHasExpectedValues(index: Int){
        
        let pancakeHouse = collection[index]
        /// Use a subscript to get the pancake house at a given index.
        ///
        /// - parameter index: The index
        ///
        /// - returns: The `PancakeHouse` for the `index`
        let plistIndex = index + 1
        //  约定好的
        
        XCTAssertEqual(pancakeHouse.name, "name \(plistIndex)")
        XCTAssertEqual(pancakeHouse.details, "details \(plistIndex)")
        
        
        XCTAssertEqual(pancakeHouse.photo, UIImage(named: "pancake\(plistIndex)"))
        
    }// help method
    
    
}
