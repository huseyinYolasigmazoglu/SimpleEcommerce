//
//  ProductViewCell.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 25.12.2020.
//

import UIKit
import SDWebImage

class ProductViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var productMainImage: UIImageView!
    
    @IBOutlet private weak var productName: UILabel!
    
    @IBOutlet private weak var productCost: UILabel!
    
    var currency = ""
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        //reset all
        productName.text = ""
        productMainImage.image = nil
        productCost.text = ""
    }
    
    func setProduct(product:Product?)  {
        
        if let _product = product {
            
            setProductImage(urlLink: _product.mainImage ?? "")
            
            setProductName(name: _product.name ?? "")
            
            if currency == "GBP" {
                print("GBP")
                setProductCost(cost: _product.cost ?? "")
            }
            else if currency == "EUR" {
                print("EUR")
                setProductCost(cost: _product.costEUR ?? "")
            }
            else {
                print("none")
                setProductCost(cost: _product.cost ?? "")
            }
        }  
    }
    
    func setProductImage(urlLink: String) {
        
        if urlLink != "" {
            let imageUrl = URL(string: urlLink)!
            
            productMainImage.sd_setImage(with: imageUrl)
        }
    }
    
    func setProductName(name: String) {
        
        if name != "" {
            productName.text = name
        }
    }
    
    func setProductCost(cost: String) {
        
        if cost != "" {
            productCost.text = cost.toTwoDigitFloatString()
        }
    }
    
}
