//
//  ProductInfoTableViewCell.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 29.12.2020.
//

import UIKit

//MARK: -Static methods and variables
extension ProductInfoTableViewCell {
    
    static let height : CGFloat = 250
    
    static let identifier = "ProductInfoTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ProductInfoTableViewCell", bundle: nil)
    }
}

//MARK: -ProductInfoTableViewCell main class
class ProductInfoTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var productCost: UILabel!
    @IBOutlet private weak var productId: UILabel!
    
    private var _height  : CGFloat = 300
    
    var product : Product? {
        
        didSet {
            
            if let detail = product {
                self.productName.text = detail.name
                self.productCost.text = detail.cost?.toTwoDigitFloatString(currencySymbol: "£") ?? ""
                self.productId.text =   "Product  no: \(detail.prodid)"
            }
            
        }
    }
    
    var height   : CGFloat {
        get {
            return self._height
        }
        set (newValue) {
            
            if (newValue < 300) {
                self._height = 300
            }
            else {
                self._height = newValue
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    override func setHighlighted(_ highlighted: Bool, animated: Bool){
        
    }
}
