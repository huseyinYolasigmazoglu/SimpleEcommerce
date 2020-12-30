//
//  DetailTableViewController.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 28.12.2020.
//

import UIKit


class DetailTableViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var flowTableView: UITableView!
    
    var product : Product?
    var productImageGallerySize : CGSize = CGSize(width: 100, height: 100)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        flowTableView.delegate = self
        flowTableView.dataSource = self
        
        flowTableView.register(ProductDetailTableViewCell.nib(), forCellReuseIdentifier: ProductDetailTableViewCell.identifier)
        
        flowTableView.register(ProductInfoTableViewCell.nib(), forCellReuseIdentifier: ProductInfoTableViewCell.identifier)
        
        productImageGallerySize = CGSize(width: self.view.frame.width, height: self.view.frame.height / 2)
        
    }
    
    @IBAction func closeView(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    func cellForImageGallery(_ indexPath:IndexPath,withIdentifier:String) -> UITableViewCell {
        
        let cell = flowTableView.dequeueReusableCell(withIdentifier: ProductDetailTableViewCell.identifier, for: indexPath) as! ProductDetailTableViewCell
        
        cell.productDetail = self.product
        cell.cellSize = productImageGallerySize
        return cell
        
    }
    
    func cellForProductDetail(_ indexPath:IndexPath,withIdentifier:String) -> UITableViewCell{
        
        let cell = flowTableView.dequeueReusableCell(withIdentifier: ProductInfoTableViewCell.identifier, for: indexPath) as! ProductInfoTableViewCell
        
        cell.product = self.product
        
        return cell
    }
    
    
}


extension DetailTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case ProductDetailSections.ImageGallery.rawValue:
            return productImageGallerySize.height
        case ProductDetailSections.ProductDetail.rawValue:
            return ProductInfoTableViewCell.height
        default:
            return 50
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case ProductDetailSections.ImageGallery.rawValue:
            return cellForImageGallery(indexPath,withIdentifier: ProductDetailTableViewCell.identifier)
        case ProductDetailSections.ProductDetail.rawValue:
            return cellForProductDetail(indexPath, withIdentifier: ProductInfoTableViewCell.identifier)
        default:
            let cell  = UITableViewCell()
            return cell
        }
    }
}
