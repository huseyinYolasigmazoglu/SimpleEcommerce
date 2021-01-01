//
//  ImageCollectionViewCell.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 28.12.2020.
//  This is the cell od image slider , called from ProductDetailTableViewCell

import UIKit
import SDWebImage

//MARK: -Static methods and variables
extension ImageCollectionViewCell{
    
    static let identifier = "ImageCollectionViewCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "ImageCollectionViewCell", bundle: nil)
    }
}

//MARK: -Main ImageCollectionViewCell
class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
