//
//  ApiOperations.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 25.12.2020.
//

import Foundation
import Alamofire

class ApiOperations {
    
    private var testUrl = "https://static-ri.ristack-3.nn4maws.net/v1/plp/en_gb/2506/products.json"
    
    
    func getAllProducts(completionhandler:@escaping (ProductDetail?) -> ())
    {
        
        AF.request(testUrl).responseDecodable(of: ProductDetail.self) { (response) in
            
            if let aResponse = response.value{
                print(aResponse)
                completionhandler(aResponse)
            }
            else{
                print("Hata")
                completionhandler(nil)
            }
        }
    }
}

