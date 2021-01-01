//
//  HeaderCollectionReusableView.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 31.12.2020.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
    @IBOutlet weak var itemCount: UILabel!
    
    func configure(productCount count: Int) {
        
        itemCount.text = "\(count) Items(s)"
    }
}
