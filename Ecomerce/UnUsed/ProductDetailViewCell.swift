//
//  ProductDetailViewCell.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 26.12.2020.
//

import UIKit
import SDWebImage

class ProductDetailViewCell: UICollectionViewCell {
    
    
    @IBOutlet private weak var productImage: UIImageView!
    
    func setProductImage(urlLink: String) {
        
        if !urlLink.isEmpty {
            
            let imageUrl = URL(string: urlLink)!
            productImage.sd_setImage(with: imageUrl)
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        //reset all
        productImage.image = nil
    }
}
