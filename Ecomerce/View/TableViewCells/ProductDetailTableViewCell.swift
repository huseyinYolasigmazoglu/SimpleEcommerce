//
//  ProductDetailTableViewCell.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 28.12.2020.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    static let identifier = "ProductDetailTableViewCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "ProductDetailTableViewCell", bundle: nil)
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    var productDetail : Product?
    var cellSize : CGSize = CGSize(width: 400, height: 400)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return productDetail?.allImages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        
        if let detail = self.productDetail{
            
            cell.setProductImage(urlLink: detail.allImages?[indexPath.row] ?? "" )
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return cellSize
    }
    
}
