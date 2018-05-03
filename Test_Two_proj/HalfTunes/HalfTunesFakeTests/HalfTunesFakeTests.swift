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
    
    override func setUp(){
        super.setUp()
        controllerUnderTest = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! SearchViewController!
       // controllerUnderTest = UIStoryboard(name: "main", bundle: nil).instantiateInitialViewController() as! SearchViewController!      // it is SUT
        
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "abbaData", ofType: "json") //" abbaData"， 我日啊， 命名不规范， 多了一个 空格

        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
        
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        let urlResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: nil, headerFields: nil)
        let sessionMock = URLSessionMock(data: data, response: urlResponse, error: nil)
        controllerUnderTest.defaultSession = sessionMock
        
    }
    
    override func tearDown() {
        controllerUnderTest = nil
        super.tearDown()
    }
    
    func test_UpdateSearchResults_ParsesData(){
        // given
        let promise = expectation(description: "Status code: 200")
        // when
        XCTAssertEqual(controllerUnderTest.searchResults.count, 0, "searchResults should be empty before the data task runs")
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        let dataTask = controllerUnderTest.defaultSession.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    promise.fulfill()
                    self.controllerUnderTest.updateSearchResults(data)      // 在这个方法里面， json 解析
                }
                
            }   //  else if let httpResponse = response as? HTTPURLResponse
            
        }   //  let dataTask =
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        
        //  then
        XCTAssertEqual(controllerUnderTest.searchResults.count, 3, "Didn't parse 3 items from fake response")
    }
    

    
}
