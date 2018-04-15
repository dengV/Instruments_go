 

// MARK: - HomeInfo

public class HomeInfo {
  
  // MARK: - Instance Properties
  public fileprivate(set) var bathroomCount: UInt
  public fileprivate(set) var bedroomCount: UInt
  public fileprivate(set) var kitchenSize: RoomSize
  public fileprivate(set) var otherRoomsCount: UInt
  public fileprivate(set) var squareFootage: UInt
  
  // MARK: - Object Lifecycle
  public init(bathroomCount: UInt,
              bedroomCount: UInt,
              kitchenSize: RoomSize,
              otherRoomsCount: UInt,
              squareFootage: UInt) {
    self.bathroomCount = bathroomCount
    self.bedroomCount = bedroomCount
    self.kitchenSize = kitchenSize
    self.otherRoomsCount = otherRoomsCount
    self.squareFootage = squareFootage
  }
  
  public func copy() -> HomeInfo {
    return HomeInfo(bathroomCount: bathroomCount,
                    bedroomCount: bedroomCount,
                    kitchenSize: kitchenSize,
                    otherRoomsCount: otherRoomsCount,
                    squareFootage: squareFootage)
  }
}

// MARK: - MutableHomeInfo
public class MutableHomeInfo: HomeInfo {
  
  // MARK: - Object Lifecyle
  public convenience init() {
    
    self.init(bathroomCount: 2,
              bedroomCount: 3,
              kitchenSize: .medium,
              otherRoomsCount: 1,
              squareFootage: 2000)
  }
    
  // MARK: - Instance Methods
  public func setBathroomCount(_ count: UInt) {
    bathroomCount = count
  }
  
  public func setBedroomCount(_ count: UInt) {
    bedroomCount = count
  }
  
  public func setKitchenSize(_ roomSize: RoomSize) {
    kitchenSize = roomSize
  }
  
  public func setOtherRoomsCount(_ count: UInt) {
    otherRoomsCount = count
  }
  
  public func setSquareFootage(_ area: UInt) {
    squareFootage = area
  }
}
