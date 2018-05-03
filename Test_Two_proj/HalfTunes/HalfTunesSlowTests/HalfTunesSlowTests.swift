//
//  HalfTunesSlowTests.swift
//  HalfTunesSlowTests
//
//  Created by dengjiangzhou on 2018/5/3.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

import XCTest


@testable import HalfTunes



class HalfTunesSlowTests: XCTestCase {
    
    var sessionUnderTest: URLSession!
    
    
    override func setUp() {
        super.setUp()
        
        
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default )
    }
    
    override func tearDown() {
        
        sessionUnderTest = nil
        
        super.tearDown()
    }
    
    func testValidCallToiTunesGetsHTTPStatusCode200(){
        // given
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        //  urlNotMock
        
        
     //   let urlMock = URL(string: "https://itune.apple.com/search?media=music&entity=song&term=abba")
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            //  then
            if let error = error{
                XCTFail("Error: \(error.localizedDescription)")
                return
                //  if let error = error{
            }
            else if let statusCode = (response as? HTTPURLResponse)?.statusCode{
                if statusCode == 200 {
                    promise.fulfill()
                }
                else{
                    XCTFail("Stauts code: \(statusCode)")
                }
                //  else if let statusCode = (response as? HTTPURLResponse)?.statusCode
            }
        }//  let dataTask =
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        
    /*
         expectation(_:) returns an XCTestExpectation object, which you store in promise. Other commonly used names for this object are expectation and future. The description parameter describes what you expect to happen.
         
         
        To match the description, you call promise.fulfill() in the success condition closure of the asynchronous method’s completion handler.
         
        waitForExpectations(_:handler:) keeps the test running until all expectations are fulfilled, or the timeout interval ends, whichever happens first.
         
         */
    }// func testValidCallToiTunesGetsHTTPStatusCode200(){
    
    
    
    // Asynchronous test: faster fail
    func testCallToiTunesCompletes(){
        // given
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        let promise = expectation(description: "Completion handler invoked")
        
        var statusCode: Int?
        var responseError: Error?       // DNG， 先走这个
        
        // when
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            
            statusCode = (response as? HTTPURLResponse)?.statusCode             // DNG， 再走这里
            responseError = error
            promise.fulfill()
            
        }//  let dataTask =
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)           // 这个方法，起到了拦截的作用，      有一点二元信号量的感觉
        
        
        XCTAssertNil(responseError)         // DNG， 然后走这里
        XCTAssertEqual(statusCode, 200)
        
    }
    
    
    
    
}
