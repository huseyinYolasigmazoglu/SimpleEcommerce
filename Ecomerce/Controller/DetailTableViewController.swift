//
//  DetailTableViewController.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 28.12.2020.
//

import UIKit

//MARK: -IBActions
extension DetailTableViewController {
    
    @IBAction private func closeView(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
}

//MARK: -Main DetailTableViewController
class DetailTableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet private weak var flowTableView: UITableView!
    
    private var productImageGallerySize : CGSize = CGSize(width: 400, height: 400)
    private var productDetailHeight : CGFloat = 400
    
    var product : Product?
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        flowTableView.delegate = self
        flowTableView.dataSource = self
        
        flowTableView.register(ProductDetailTableViewCell.nib(), forCellReuseIdentifier: ProductDetailTableViewCell.identifier)
        
        flowTableView.register(ProductInfoTableViewCell.nib(), forCellReuseIdentifier: ProductInfoTableViewCell.identifier)
        
    }
    //dynamic calculation of tableviewCells.
    override func viewWillLayoutSubviews() {
        
        let halfOftheScreen = self.view.safeAreaLayoutGuide.layoutFrame.size.height / 2
        
        productDetailHeight = halfOftheScreen
        
        productImageGallerySize = CGSize(width: self.view.frame.width, height: halfOftheScreen)
        
    }
    
    func cellForImageGallery(_ indexPath:IndexPath,withIdentifier:String) -> UITableViewCell {
        
        let cell = flowTableView.dequeueReusableCell(withIdentifier: ProductDetailTableViewCell.identifier, for: indexPath) as! ProductDetailTableViewCell
        
        cell.productDetail = self.product
        cell.cellSize = productImageGallerySize
        
        return cell
        
    }
    
    func cellForProductDetail(_ indexPath:IndexPath,withIdentifier:String) -> UITableViewCell {
        
        let cell = flowTableView.dequeueReusableCell(withIdentifier: ProductInfoTableViewCell.identifier, for: indexPath) as! ProductInfoTableViewCell
        
        cell.product = self.product
        cell.height  = self.productDetailHeight
        
        return cell
    }
}

//MARK: -UITableViewDataSource
extension DetailTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        
        case ProductDetailSections.imageGallery.rawValue:
            return productImageGallerySize.height
            
        case ProductDetailSections.productDetail.rawValue:
            return productDetailHeight
        default:
            return 50
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        
        case ProductDetailSections.imageGallery.rawValue:
            return cellForImageGallery(indexPath,withIdentifier: ProductDetailTableViewCell.identifier)
            
        case ProductDetailSections.productDetail.rawValue:
            return cellForProductDetail(indexPath, withIdentifier: ProductInfoTableViewCell.identifier)
            
        default:
            let cell  = UITableViewCell()
            return cell
        }
    }
}
