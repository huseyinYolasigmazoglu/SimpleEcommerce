//
//  ProductNameTableViewCell.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 29.12.2020.
//

import UIKit

class ProductNameTableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var productName: UILabel!
    
    static let identifier = "ProductNameTableViewCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "ProductNameTableViewCell", bundle: nil)
    }
    
    var productDetail : Product?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let detail = productDetail {
            
            productName.text = detail.name ?? "XX"
        }
        else{
            productName.text = "Hellx"
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
