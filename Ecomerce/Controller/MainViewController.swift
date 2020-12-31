//
//  MainViewController.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 25.12.2020.
//

import UIKit 

class MainViewController: UIViewController {
    
    private var collectionViewCellWidth : CGFloat = 180
    private var  allProducts : ProductDetail?
    
    private var manager : ProductManager  =  ProductManager(endPoint: Constants.testUrl, imageUrl: Constants.mainImageUrlBase)
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewCellWidth = (self.view.frame.width) / 2 - 15
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        manager.delegate = self
        
        manager.getProducts()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            
            if identifier == Constants.goToDetailFlowSegue
            {
                if let destinationViewController = segue.destination as? DetailTableViewController {
                    
                    if let index = sender as? IndexPath {
                        
                        destinationViewController.product = manager.getProduct(index.row)
                    }
                }
            }
        }
    }
}

//MARK: - UICollectionView extensions - DataSource
extension MainViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        performSegue(withIdentifier: Constants.goToDetailFlowSegue, sender: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.allProducts?.Products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.ProductCell, for: indexPath) as! ProductViewCell
        
        
        cell.setProduct(product: manager.getProduct(indexPath.row))
        
        return cell   
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        
        cell.configure(productCount: self.allProducts?.Products.count ?? 0)
        
        return cell
    }
    
    
}

//MARK: - UICollectionView extensions - FlowLayout
extension MainViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionViewCellWidth, height: Constants.productCellWith)
    }
    
}

//MARK: -ManagerDelegate
extension MainViewController : ProductManagerDelegate {
    
    func loadData(_ productManagerDelegate: ProductManager, allProducts: ProductDetail?) {
        
        self.allProducts = allProducts
        collectionView.reloadData()
    }
}
