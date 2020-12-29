//
//  DetailTableViewController.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 28.12.2020.
//

import UIKit

class DetailTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var flowTableView: UITableView!
    
    var product : Product?
    var productImageSize : CGSize = CGSize(width: 100, height: 100)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        flowTableView.delegate = self
        flowTableView.dataSource = self
        flowTableView.register(ProductDetailTableViewCell.nib(), forCellReuseIdentifier: ProductDetailTableViewCell.identifier)
        
        productImageSize = CGSize(width: self.view.frame.width, height: self.view.frame.height / 2)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = flowTableView.dequeueReusableCell(withIdentifier: ProductDetailTableViewCell.identifier, for: indexPath) as! ProductDetailTableViewCell
        
        cell.productDetail = self.product
        cell.cellSize = productImageSize
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return productImageSize.height
    }
    
}
