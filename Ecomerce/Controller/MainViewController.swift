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
    
    private var manager : ProductManager  =  ProductManager()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewCellWidth = (self.view.frame.width) / 2 - 15
        
        collectionView.dataSource = self
        collectionView.delegate = self
        manager.delegate = self
        
        manager.getProducts()
        
    }
}



//MARK: - UICollectionView extensions - DataSource
extension MainViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.allProducts?.Products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductViewCell
        
        cell.setProductImage(urlLink: manager.getImgLocation(indexPath.row))
        
        return cell
        
    }
    
    
}


//MARK: - UICollectionView extensions - FlowLayout
extension MainViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionViewCellWidth, height: collectionViewCellWidth)
    }
    
}



//MARK: -ManagerDelegate
extension MainViewController : ProductManagerDelegate {
    
    func loadData(_ pokemonManagerDelegate: ProductManager, allProducts: ProductDetail?) {
        
        self.allProducts = allProducts
        collectionView.reloadData()
    }
    
    
    
}
