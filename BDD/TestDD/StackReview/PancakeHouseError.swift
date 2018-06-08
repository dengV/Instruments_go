//
//  PancakeHouseError.swift
//  StackReview
//
//  Created by Joshua Greene on 10/14/16.
//  Copyright © 2016 Razeware. All rights reserved.
//

import Foundation

public enum PancakseHouseError: Error {
  
  // Error thrown if you try to remove the favorite pancake house, which isn't allowed.
  case triedToRemoveFavoritePancakeHouse
  
  // Error thrown if you try to remove a pancake house that's not part of the collection.
  case triedToRemoveUnknownPancakeHouse
}
