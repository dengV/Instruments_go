
import Foundation

// Heart of the project. 数据层， 模型， 以及 数据 的 管理。


public class PancakeHouseCollection {
  
  // MARK: - Injected Properties
  
  internal var _cloudNetworkManager: CloudNetworkManager = CloudNetworkManager()
  
  // MARK: - Internal Properties
  
  internal var _pancakeHouses: [PancakeHouse] = []
  internal var _favorite: PancakeHouse? = nil
  
  
  // MARK: - Public Properties
  
  /// Get the number of pancake houses in the collection
  public var count: Int {
    return _pancakeHouses.count
  }
  
  /// Use a subscript to get the pancake house at a given index.
  ///
  /// - parameter index: The index
  ///
  /// - returns: The `PancakeHouse` for the `index`
  public subscript(index: Int) -> PancakeHouse {
    return _pancakeHouses[index]
  }
  
  /// Use this method to load the default pancake hosues from the `pancakes_houses` plist in the main bundle.
  public func loadDefaultPancakeHouses() {
    loadPancakeHouses("pancake_houses", in: Bundle.main)
  }// plist 文件
    
    
  
  /// Use this method to load the pancake houses from the plist name in the given bundle.
  ///
  /// - parameter plistName: The plist name
  /// - parameter bundle:    The bundle
  public func loadPancakeHouses(_ plistName: String, in bundle: Bundle) {
    let path = bundle.path(forResource: plistName, ofType: "plist")!
    let array = NSArray(contentsOfFile: path) as! [[String : Any]]
    _pancakeHouses = PancakeHouse.from(array)
  }
  
    
    
  /// Use this method to load pancakes from the cloud. 云端的
  ///
  /// This method returns immediately and calls the completion handler when finished, with a Boolean parameter on whether data was loaded or not.
  ///
  /// @warning  Cloud login hasn't been implemented! The backend engineers on still working on the SSO/TTL/RFLOL codez...
    //  TTL （生存时间值）,  Time To Live
    //
    
  ///
  /// - parameter completion: The completion handler to be called after loading
  public func loadPancakesFromCloud(completion: ((Bool) -> ())?) {
        
    _cloudNetworkManager.loadPancakeHouses(success: { [weak self] (pancakeHouses) in
      guard let strongSelf = self else { return }
      strongSelf._pancakeHouses = pancakeHouses
      completion?(true)
      
      }, failure: { (error) in
        print("Error: \(error)")
        completion?(false)
    })
    
  }
  
  /// Stores the current favorite pancake house. The one you set _must_ already be in the collection.
  public var favorite: PancakeHouse? {
    get {
      return _favorite
    }
    set {
      
      guard let newValue = newValue, _pancakeHouses.contains(newValue) else {
        _favorite = nil
        return
      }
      
      _favorite = newValue
    }
  }
  
  /// Use this method to check if a pancake house is the favorite.
  ///
  /// - parameter pancakeHouse: The pancake house to check
  ///
  /// - returns: `true` if the pancake house is the favorite or `false` otherwise
  public func isFavorite(_ pancakeHouse: PancakeHouse) -> Bool {
    guard let currentFavorite = favorite else { return false }
    return currentFavorite == pancakeHouse
  }
  
    
    
    
  /// Use this method to add a new pancake house to the collection
  ///
  /// - parameter pancakeHouse: The pancake house to be added
  public func addPancakeHouse(_ pancakeHouse: PancakeHouse) {
    _pancakeHouses.append(pancakeHouse)
  }
  
    
    
// MARK: - DNG 好
    
    
  /// @brief  Use this method to remove a pancake house from the collection.
  ///
  /// @discussion  If the pancake house isn't part of the collection, throws `PancakseHouseError.triedToRemoveUnknownPancakeHouse` error.
  /// If the pancake house is the current favorite, throws `PancakseHouseError.triedToRemoveFavoritePancakeHouse` error.
  ///
  /// - parameter pancakeHouse: The pancake house to be removed
  public func removePancakeHouse(_ pancakeHouse: PancakeHouse) throws {
    
    guard let index = _pancakeHouses.index(of: pancakeHouse) else {
      throw PancakseHouseError.triedToRemoveUnknownPancakeHouse
    }
    
    guard !isFavorite(pancakeHouse) else {
      throw PancakseHouseError.triedToRemoveFavoritePancakeHouse
    }
    
    _pancakeHouses.remove(at: index)
  }
}
