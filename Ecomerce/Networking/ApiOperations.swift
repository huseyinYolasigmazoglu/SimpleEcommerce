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
    
    
    func getAllProducts(_ url:String,completionhandler:@escaping (ProductDetail?,Error?) -> ())
    {
        AF.request(url).responseDecodable(of: ProductDetail.self) { (response) in
            
            if let aResponse = response.value{
                completionhandler(aResponse,response.error)
            }
            else{
                print("Exception \(String(describing: response.error))")
                completionhandler(nil,response.error)
            }
        }
    }
}

