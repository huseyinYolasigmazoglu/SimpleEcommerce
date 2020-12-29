//
//  LikeCountTableViewCell.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 29.12.2020.
//

import UIKit

class LikeCountTableViewCell: UITableViewCell {

    static let identifier = "LikeCountTableViewCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "LikeCountTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
