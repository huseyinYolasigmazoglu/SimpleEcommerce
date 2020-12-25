//
//  MainViewController.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 25.12.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    private var collectionViewCellWidth : CGFloat = 180
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageStr : String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewCellWidth = (self.view.frame.width) / 2 - 15
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let trial = ApiOperations()
        trial.getAllProducts { (products) in
            //print huseyin
           print(products?.Metadata.Breadcrumbs)
           print(products?.Products[0].name)
           print(products?.Products[0].altImage)
           print(products?.Products[0].allImages[0])
            
            self.imageStr = products?.Products[0].allImages[0]
            self.collectionView.reloadData()
        }

    }
}



//MARK: - UICollectionView extensions - DataSource
extension MainViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductViewCell
        
        cell.setProductImage(urlLink: self.imageStr ?? "")
        
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
