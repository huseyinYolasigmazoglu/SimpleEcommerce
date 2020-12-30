//
//  ProductInfoTableViewCell.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 29.12.2020.
//

import UIKit

//MARK: -Static methods and variables
extension ProductInfoTableViewCell {
    
    static let height : CGFloat = 336
    
    static let identifier = "ProductInfoTableViewCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "ProductInfoTableViewCell", bundle: nil)
    }
}

//MARK: -ProductInfoTableViewCell main class
class ProductInfoTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var productCost: UILabel!
    @IBOutlet private weak var productId: UILabel!
    
    var product : Product?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let detail = product {
            self.productName.text = detail.name
            self.productCost.text = detail.cost?.toTwoDigitFloat() ?? ""
            self.productId.text =   "Product  no: \(detail.prodid ?? "")"
        }
    }
}
