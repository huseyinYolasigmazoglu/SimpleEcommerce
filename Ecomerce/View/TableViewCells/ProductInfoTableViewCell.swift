//
//  ProductInfoTableViewCell.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 29.12.2020.
//

import UIKit

class ProductInfoTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet weak var productCost: UILabel!
    @IBOutlet weak var productId: UILabel!
    
    var product : Product? 
    
    static let identifier = "ProductInfoTableViewCell"
    
    static let height : CGFloat = 250
    
    static func nib() -> UINib
    {
        return UINib(nibName: "ProductInfoTableViewCell", bundle: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let detail = product {
            self.productName.text = detail.name
            self.productCost.text = detail.cost?.toTwoDigitFloat() ?? ""
            self.productId.text =   "Product  no: \(detail.prodid ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
