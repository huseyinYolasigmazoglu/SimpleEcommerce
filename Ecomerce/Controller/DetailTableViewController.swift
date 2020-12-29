//
//  DetailTableViewController.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 28.12.2020.
//

import UIKit

class DetailTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBAction func close(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var flowTableView: UITableView!
    
    var product : Product?
    var productImageSize : CGSize = CGSize(width: 100, height: 100)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        flowTableView.delegate = self
        flowTableView.dataSource = self
        
        flowTableView.register(ProductDetailTableViewCell.nib(), forCellReuseIdentifier: ProductDetailTableViewCell.identifier)
        
        
        
        flowTableView.register(ProductInfoTableViewCell.nib(), forCellReuseIdentifier: ProductInfoTableViewCell.identifier)
        
        
        productImageSize = CGSize(width: self.view.frame.width, height: self.view.frame.height / 2)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //navigationController?.isNavigationBarHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            
            let cell = flowTableView.dequeueReusableCell(withIdentifier: ProductDetailTableViewCell.identifier, for: indexPath) as! ProductDetailTableViewCell
            
            cell.productDetail = self.product
            cell.cellSize = productImageSize
            return cell
        }
        else if indexPath.row == 1 {
            
            let cell = flowTableView.dequeueReusableCell(withIdentifier: ProductInfoTableViewCell.identifier, for: indexPath) as! ProductInfoTableViewCell
            
            cell.product = self.product
            
            return cell
        }
        
        else{
            let cell  = UITableViewCell()
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return productImageSize.height
        }
        else {
            return ProductInfoTableViewCell.height
        }
    }
    
}
