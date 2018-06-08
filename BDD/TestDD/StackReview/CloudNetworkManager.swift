
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
