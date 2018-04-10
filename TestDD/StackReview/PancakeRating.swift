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

import UIKit

public enum PancakeRating {
  
  // MARK: - Cases
  
  case unknown
  case rating(Int)
    
  // MARK: - Computed Properties
  
  public var ratingImage : UIImage? {
    guard let baseName = ratingImageName else {
      return nil
    }
    return UIImage(named: baseName)
  }
  
  public var smallRatingImage : UIImage? {
    guard let baseName = ratingImageName else {
      return nil
    }
    return UIImage(named: "\(baseName)_small")
  }
  
  fileprivate var ratingImageName : String? {
    switch self {
    case .unknown:
      return nil
    case .rating(let value):
      return "pancake_rate_\(value)"
    }
  }
  
  public var value: Int? {
    switch self {
    case .rating(let value):
      return value
    case .unknown:
      return nil
    }
  }
  
  // MARK: - Object Lifecycle
  
  public init?(value: Int) {
    if value > 0 && value <= 5 {
      self = .rating(value)
    } else {
      self = .unknown
    }
  }
}

extension PancakeRating: Equatable {  
  public static func ==(lhs: PancakeRating, rhs: PancakeRating) -> Bool {
    return lhs.value == rhs.value
  }
}
