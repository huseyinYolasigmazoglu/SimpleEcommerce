//
//  FilterViewController.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 27.12.2020.
//

import UIKit

class FilterViewController: UIViewController {
    
    @IBOutlet private weak var applyButton: UIButton!
    
    
    @IBAction func dismissView(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func apply(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureApplyButton()
        
        
    }
    private func configureApplyButton(){
        
        applyButton.layer.borderWidth = 3
        applyButton.layer.borderColor = UIColor.black.cgColor
        applyButton.layer.cornerRadius = 25.0
    }
    
}
