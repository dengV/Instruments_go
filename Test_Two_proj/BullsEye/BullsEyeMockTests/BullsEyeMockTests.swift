//
//  BullsEyeMockTests.swift
//  BullsEyeMockTests
//
//  Created by dengjiangzhou on 2018/5/4.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

import XCTest


@testable import BullsEye


class MockUserDefaults: UserDefaults {
    var gamesStyleChanged = 0
    
    override func set(_ value: Int, forKey defaultName: String){
        if defaultName == "gameStyle"{
            gamesStyleChanged += 1
        }
    }
    //  MockUserDefaults overrides the set(_:forKey:) method to increment the gameStyleChanged flag. Often you’ll see similar tests that set a Bool variable, but incrementing an Int gives you more flexibility — for example, your test could check that the method is called exactly once.
}// class MockUserDefaults: UserDefaults



class BullsEyeMockTests: XCTestCase {
    
    var controllerUnderTest: ViewController!    //   sut, system under test
    var mockUserDefautlts: MockUserDefaults!
    
    
    override func setUp() {
        super.setUp()
        
        controllerUnderTest = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
        mockUserDefautlts = MockUserDefaults(suiteName: "testing")
        controllerUnderTest.defaults = mockUserDefautlts
        
        
    }
    
    
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        controllerUnderTest = nil
        mockUserDefautlts = nil
        
        super.tearDown()
    }
    
    
    func testGameStyleCanBeChanged(){
        //  given
        let segmentedControl = UISegmentedControl()
        
        // when
        XCTAssertEqual(mockUserDefautlts.gamesStyleChanged, 0, "gameStyleChanged should be 0 before sendActions")
        segmentedControl.addTarget(controllerUnderTest, action: #selector(ViewController.chooseGameStyle(_:)), for: .valueChanged)
        segmentedControl.sendActions(for: .valueChanged)
        
        // 这个写的好， 控件完全，自己手工了
        
        //  then
        XCTAssertEqual(mockUserDefautlts.gamesStyleChanged, 1, "gameStyle user default wasn't changed")
    }
    
    

    
}












