//
//  BullsEyeUITests.swift
//  BullsEyeUITests
//
//  Created by dengjiangzhou on 2018/5/4.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

import XCTest

class BullsEyeUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        
        app.launch()
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameStyleSwitch() {
      // given
        let slideButton = app.segmentedControls.buttons["Slide"]
        let typeButton = app.segmentedControls.buttons["Slide"]
        let slideLabel = app.staticTexts["Get as close as you can to: "]//  "Get as close as you can to: ",  这个 str 是 key, 不包含最右边的空格也可以， 我测了下， str 应该是 contains 关系
        let typeLabel = app.staticTexts["Guess where the slider is: "]
 
        // then
        if slideButton.isSelected {
            XCTAssertTrue(slideLabel.exists )
            XCTAssertFalse(typeLabel.exists )
            
            typeButton.tap()
            XCTAssertTrue(typeLabel.exists )
            XCTAssertFalse(slideLabel.exists )
        }
        else if typeButton.isSelected{
            
            XCTAssertTrue(typeLabel.exists )
            XCTAssertFalse(slideLabel.exists )
            
            slideButton.tap()
            XCTAssertTrue(slideLabel.exists )
            XCTAssertFalse(typeLabel.exists )

        }

        //  Open a new line in testGameStyleSwitch() and click the red Record button at the bottom of the editor window:
    }// 好牛逼啊， 录制 手势点击 为代码
    
}


/*
 
 // raw code:
 
 
 let app = XCUIApplication()
 app.sliders["27%"].swipeRight()
 app.otherElements.containing(.button, identifier:"hit me!").children(matching: .other).element(boundBy: 0).children(matching: .textField).element.tap()
 
 
 */


//  When the app appears in the simulator, tap the Slide segment of the game style switch and the top label. Then click the Xcode Record button to stop the recording.
// 看错了， 应该是
// 点击 右下角的 segment control
//不是 滑动 slide

//  Line 1 duplicates the property you created in setup() and you don’t need to tap anything yet, so also delete the first line and the .tap() at the end of lines 2 and 3. Open the little menu next to ["Slide"] and select segmentedControls.buttons["Slide"].



/*
 
 
 //  raw code:
 
 let app = XCUIApplication()
 app/*@START_MENU_TOKEN@*/.segmentedControls.buttons["Slide"]/*[[".segmentedControls.buttons[\"Slide\"]",".buttons[\"Slide\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
 app.staticTexts["Get as close as you can to: "].tap()
 
 */

// 这是 正确的 点击姿势
