//
//  ProductDetailViewController.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 26.12.2020.
//

import UIKit

class ProductDetailViewController: UIViewController, UICollectionViewDelegate {
    
    
    @IBOutlet private weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet private weak var productName: UILabel!
    
    @IBOutlet private weak var productCost: UILabel!
    
    @IBOutlet private weak var productId: UILabel!
    
    
    
    private var product:Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
        
        
        if let detail = product {
            self.productName.text = detail.name
            self.productCost.text = detail.cost?.toTwoDigitFloatString() ?? ""
            self.productId.text =   "Product  no: \(detail.prodid ?? "")"
        }
    }
    
    func loadProductDetails(product:Product?)  {
        
        if let detail = product {
            
            self.product = detail
        }
        else{
            print("emty")
        }
        
    }
    
}
//MARK: - UICollectionView extensions - DataSource
extension ProductDetailViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.product?.allImages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.ProductDetailCell, for: indexPath) as! ProductDetailViewCell
        
        
        cell.setProductImage(urlLink: product?.allImages?[indexPath.row] ?? "")
        
        return cell
    }
}


//MARK: - UICollectionView extensions - FlowLayout
extension ProductDetailViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: sliderCollectionView.frame.width, height: sliderCollectionView.frame.height)
    }
    
}


