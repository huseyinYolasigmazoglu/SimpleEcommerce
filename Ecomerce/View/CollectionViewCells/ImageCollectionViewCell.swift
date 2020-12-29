//
//  ImageCollectionViewCell.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 28.12.2020.
//

import UIKit
import SDWebImage

class ImageCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "ImageCollectionViewCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "ImageCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet private weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
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
