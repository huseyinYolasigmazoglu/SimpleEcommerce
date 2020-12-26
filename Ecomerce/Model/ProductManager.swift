//
//  ProductManager.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 26.12.2020.
//

import Foundation

protocol ProductManagerDelegate {
    
    func loadData(_ pokemonManagerDelegate: ProductManager,allProducts: ProductDetail? )
}


class ProductManager {
    
    private var productApi: ApiOperations
    private var  allProducts : ProductDetail?
    
    var delegate : ProductManagerDelegate?
    
    init() {
        productApi = ApiOperations()
    }
    
    func getProducts()  {
        
        productApi.getAllProducts { (products) in
            
            self.allProducts = products
            self.delegate?.loadData(self, allProducts: products)
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



