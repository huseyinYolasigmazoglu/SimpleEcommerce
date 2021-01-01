//
//  ProductDetailTableViewCell.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 28.12.2020.
//

import UIKit

//MARK: -Static functions and variables
extension ProductDetailTableViewCell {
    
    static let identifier = "ProductDetailTableViewCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "ProductDetailTableViewCell", bundle: nil)
    }
    
    static let minCellWidth  : CGFloat  = 300
    static let minCellHeight : CGFloat  = 300
    
}

//MARK: -ProductDetailTableViewCell Main class
class ProductDetailTableViewCell: UITableViewCell {
    
    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    private var currentPageControlIndex = 0
    private var _cellSize : CGSize = CGSize(width: ProductDetailTableViewCell.minCellWidth, height: ProductDetailTableViewCell.minCellHeight)
    
    var productDetail : Product?
    
    var cellSize : CGSize {
        get{
            return _cellSize
        }
        set (newValue) {
            
            if (newValue.height < ProductDetailTableViewCell.minCellHeight) {
                _cellSize = CGSize(width: newValue.width, height: ProductDetailTableViewCell.minCellHeight)
            }
            else{
                _cellSize = CGSize(width: newValue.width, height: newValue.height)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let product = productDetail {
            pageControl.numberOfPages = product.allImages?.count ?? 0
        }
        else {
            pageControl.numberOfPages = 0
        }
    }
}

//MARK: -UICollectionView functions
extension ProductDetailTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
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
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / collectionView.frame.size.width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return cellSize
    }
    
}
