//
//  ProductManager.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 26.12.2020.
//

import Foundation

protocol ProductManagerDelegate {
    
    func loadData(_ productManagerDelegate: ProductManager,allProducts: ProductDetail? )
}

class ProductManager {
    
    private var productApi: ApiOperations
    private var allProducts : ProductDetail?
    private var endPointUrl :String
    
    var delegate : ProductManagerDelegate?
    
    init() {
        productApi = ApiOperations()
        endPointUrl = Constants.testUrl
    }
    
    func setUrl(with url:String)  {
        
        endPointUrl =  url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
    
    func getProducts()  {
        
        productApi.getAllProducts(endPointUrl) { (products, error) in
            if error == nil {
                
                if let all = products{
                    
                    self.allProducts = all
                    self.delegate?.loadData(self, allProducts: all)
                }
            }
        }
    }
    
    func getImgLocation(_ index:Int) -> String {
        var imageUrl = ""
        
        if let product = self.allProducts?.Products[index]
        {
            imageUrl = product.altImage ?? ""
        }
        
        return imageUrl
    }
    
    func getProductName(_ index:Int) -> String{
        
        var name = ""
        
        if let product = self.allProducts?.Products[index]
        {
            name = product.name ?? ""
        }
        
        return name
    }
    
    func getProductPrice(_ index:Int) -> String{
        
        var cost = ""
        
        if let product = self.allProducts?.Products[index]
        {
            cost = product.cost ?? ""
        }
        
        return cost
    }
    
    func getProduct(_ index:Int) -> Product?{
        
        var product : Product? = nil
        
        if let result = self.allProducts?.Products[index]
        {
            product = result
        }
        
        return product
    }
}



