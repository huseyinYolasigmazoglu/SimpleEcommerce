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
    
    //MARK: - private variables
    
    private var productApi = ApiOperations()
    private var allProducts : ProductDetail?
    private var endPointUrl :String
    private var mainImageUrlBase :String
    
    var delegate : ProductManagerDelegate?
    
    
    //MARK: - Constructor
    init(endPoint:String,imageUrl:String) {
        
        self.endPointUrl = Constants.testUrl
        self.mainImageUrlBase = Constants.mainImageUrlBase
    }
    
    //MARK: - Private Functions
    private func setAllMainImages()  {
        if let products = self.allProducts?.Products
        {
            for item in products {
                setImgLocation(product: item)
            }
        }
    }
    
    private func setImgLocation(product:Product?) {
        
        if let prdct = product
        {
            let image = prdct.mainImage ?? ""
            
            if image.isEmpty {
                prdct.mainImage = findMainImage(id: prdct.prodid!)
            }
        }
    }
    
    private func findMainImage(id:String) -> String  {
        
        if id.isEmpty {
            return ""
        }
        else{
            return mainImageUrlBase + id + "_main"
        }
    }
    
    //MARK: - Functions
    func setUrl(with url:String)  {
        
        endPointUrl =  url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
    
    func setMainImageUrl(with url:String)  {
        
        mainImageUrlBase =  url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
    
    func getProducts()  {
        
        productApi.getAllProducts(endPointUrl) { (products, error) in
            if error == nil {
                
                if let all = products{
                    
                    self.allProducts = all
                    //self.setAllMainImages()
                    self.delegate?.loadData(self, allProducts: all)
                }
            }
        }
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
            setImgLocation(product: product)
        }
        
        return product
    }
}



