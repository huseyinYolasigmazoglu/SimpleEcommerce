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
    
    func setProduct(product:Product?)  {
        
        if let _product = product {
            
            setProductImage(urlLink: _product.mainImage ?? "")
            
            setProductName(name: _product.name ?? "")
            
            setProductCost(cost: _product.cost ?? "")
        }  
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        //reset all
        productName.text = ""
        productMainImage.image = nil
        productCost.text = ""
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
            productCost.text = cost.toTwoDigitFloat()
        }
    }
    
}