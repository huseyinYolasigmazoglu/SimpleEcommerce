//
//  ProductManager.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 26.12.2020.
//

import Foundation

//MARK: - protocol
protocol ProductManagerDelegate : class{
    
    func loadData(_ productManagerDelegate: ProductManager,allProducts: ProductDetail? )
}

class ProductManager {
    
    //MARK: - private variables
    
    private var productApi = ApiOperations()
    private var allProducts : ProductDetail?
    private var _endPointUrl :String
    private var _mainImageUrlBase :String
    
    //MARK: -  variables
    
    var endPointUrl:String{
        get{
            return _endPointUrl
        }
        set (newValue){
            
            _endPointUrl =  newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        }
    }
    
    var mainImageUrlBase:String{
        get{
            return _mainImageUrlBase
        }
        set (newValue){
            
            _mainImageUrlBase =  newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        }
    }
    
    weak var delegate : ProductManagerDelegate?
    
    
    //MARK: - Constructor
    init(endPoint:String,imageUrl:String) {
        
        self._endPointUrl = endPoint
        self._mainImageUrlBase = imageUrl
    }
    
    //MARK: - Private Functions
    private func setAllMainImages() {
        if let products = self.allProducts?.Products {
            for item in products {
                setImgLocation(product: item)
            }
        }
    }
    
    private func productsFirstExtend()  {
        if let products = self.allProducts?.Products {
            for item in products {
                
                item.costFloat = item.cost?.toFloat()
                setImgLocation(product: item)
            }
        }
    }
    
    private func setImgLocation(product:Product?) {
        
        if let prdct = product {
            let image = prdct.mainImage ?? ""
            
            if image.isEmpty {
                prdct.mainImage = findMainImage(id: prdct.prodid)
            }
        }
    }
    private func findMainImage(id:String) -> String  {
        
        if id.isEmpty {
            return ""
        }
        else {
            return mainImageUrlBase + id + "_main"
        }
    }
    
    //MARK: - Functions
    
    func getProducts()  {
        
        productApi.getAllProducts(endPointUrl) { (products, error) in
            if error == nil {
                
                if let all = products{
                    
                    self.allProducts = all
                    self.productsFirstExtend()
                    self.delegate?.loadData(self, allProducts: all)
                }
            }
        }
    }
    
    func getProduct(_ index:Int) -> Product? {
        
        var product : Product? = nil
        
        if let result = self.allProducts?.Products[index] {
            product = result
            //setImgLocation(product: product)
        }
        return product
    }
}



