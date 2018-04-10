/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation

public class CloudNetworkManager {
  
  public private(set) var isAuthenticated = false
  
  public func login(userName: String, password: String, success: ()->(), failure: (Error)->()) {
    assertionFailure("login hasn't been implemented yet...!")
  }
    
  public func loadPancakeHouses(success: @escaping ([PancakeHouse])->(),
                                failure: @escaping (CloudNetworkError)->()) {
    
    /*
     Due to cloud cutbacks, we've faked the networking below: we wait a little bit and then reload the default pancake houses...
     */
    let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: delayTime) { [weak self] in
      
      guard let strongSelf = self else { return }
      
      guard strongSelf.isAuthenticated else {
        failure(.notAuthenticated)
        return
      }
      
      let path = Bundle.main.path(forResource: "pancake_houses", ofType: "plist")!
      let array = NSArray(contentsOfFile: path) as! [[String : Any]]
      let pancakeHouses = PancakeHouse.from(array)
      success(pancakeHouses)
    }
  }
}
