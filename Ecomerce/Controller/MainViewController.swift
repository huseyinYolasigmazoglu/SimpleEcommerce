//
//  MainViewController.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 25.12.2020.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let trial = ApiOperations()
        trial.getAllProducts { (products) in
            //print huseyin
           print(products?.Metadata.Breadcrumbs)
           print(products?.Products[0].name)
           print(products?.Products[0].altImage)
           print(products?.Products[0].allImages[0])
        }

    }
    

}
