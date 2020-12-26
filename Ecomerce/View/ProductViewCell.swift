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
    
}
