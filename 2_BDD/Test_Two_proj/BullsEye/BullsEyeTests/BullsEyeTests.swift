//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by dengjiangzhou on 2018/4/24.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

import XCTest


@testable import BullsEye





class BullsEyeTests: XCTestCase {
    
    
    var gameUnderTest: BullsEyeGame!
    
    
    override func setUp() {
        super.setUp()
        gameUnderTest = BullsEyeGame()
        gameUnderTest.startNewGame()
        
        
        
    }
    
    
    
    
    override func tearDown() {
        gameUnderTest = nil
        
        
        
        super.tearDown()
    }
    
    
    // greater than
    func testScoreIsComputedWhenGuessGTTarget(){
        // given,        arrage
        let guess = gameUnderTest.targetValue + 5
        
        // when,        act
        _ = gameUnderTest.check(guess: guess)
        
        print("\n\ngameUnderTest.targetValue  is  \(gameUnderTest.targetValue)\n\n")
        
        print("\n\ngameUnderTest.scoreRound  is  \(gameUnderTest.scoreRound)\n\n")
        
        // then,        assert
        XCTAssertEqual(gameUnderTest.scoreRound, 95, "Score Computed from guess is wrong")
    }
    
    // less than
    func testScoreIsComputedWhenGuessLTTarget(){
        // given,        arrage
        let guess = gameUnderTest.targetValue - 5
        
        // when,        act
        _ = gameUnderTest.check(guess: guess)
        
        print("\n\ngameUnderTest.scoreRound  is  \(gameUnderTest.scoreRound)\n\n")

        // then,        assert
        XCTAssertEqual(gameUnderTest.scoreRound, 95, "Score Computed from guess is wrong")
        
        
        
        
        /*
        self.measure {}
        */
    }
  
    
}
