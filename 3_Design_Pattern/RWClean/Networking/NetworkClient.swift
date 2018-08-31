 

import Foundation

public final class NetworkClient {
  
  // MARK: - Instance Properties
  internal let baseURL: URL
  internal let session = URLSession.shared
  
    
  // MARK: - Class Constructors
  public static let shared: NetworkClient = {
    let file = Bundle.main.path(forResource: "ServerEnvironments", ofType: "plist")!
    let dictionary = NSDictionary(contentsOfFile: file)!
    let urlString = dictionary["service_url"] as! String
    let url = URL(string: urlString)!
    return NetworkClient(baseURL: url)
  }()
    
    
  
  // MARK: - Object Lifecycle
  private init(baseURL: URL) {    
    self.baseURL = baseURL
  }
    
    
    
    
    public func getProducts(forType type: Product.ProductType, success _success: @escaping ([Product]) -> Void, failure _failure: @escaping (NetworkError) -> Void){
    
        let success: ([Product]) -> Void = {    products in
            DispatchQueue.main.async {
                _success(products)
            }
        }
        
        let failure: (NetworkError) -> Void = {    error in
            DispatchQueue.main.async {
                _failure(error)
            }
        }
    
        let url = baseURL.appendingPathComponent("products/\(type.rawValue)")
    
        /*
         
         This takes in a type , which is a product type.
         
         
         And under the hood here ,
         this is just simply an enum that we'll use to create
         the desired Business or Home endpoints here.
         
         
         
         */
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode.isSuccessHTTPCode ,
                let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data),
                let json = jsonObject as? [[String: Any]]
            else{
                if let error = error {
                    failure(NetworkError(error: error))
                }
                else{
                    failure(NetworkError(response: response))
                }
                return
                
                
/*
                 If any of this is not true, we will call the failures.
                 If there is a actually an error object,
                 as part of this completion handler.
                 
                 
                 
                //       failure(NetworkError(error: error))
                 If there is actually an error object , as part of this completion handler      ,   We will try to create a network error using it.
                 
                 
                 Otherwise , we will use the response to create this network error.
                 
                 */
                
                
                
                
            }
            let products = Product.array(jsonArray: json)
            success(products)
        })
        task.resume()
        
    }
    
    
    
    
   
    
}
 
 
 /*
  public func getProducts(forType type: Product.ProductType, success _success: @escaping ([Product])) -> Void, failure _failure: @escaping (NetworkError) -> Void){
  
  
  
  
  @escaping ([Product])) -> Void , 这 里多了 一个括号   “)”
  */

 
 
 
 
 
 
 
 
 
 
 
