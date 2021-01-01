//
//  FilterViewController.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 27.12.2020.
//

import UIKit


//MARK: -protocol
protocol FilterViewControllerDelegate {
    
    func sort(_ filterDelegate: FilterViewController,sortCase: Int)
}

//MARK: -IBActions
extension FilterViewController {
    
    @IBAction func clear(_ sender: Any) {
        
        selectedSortIndex = SortEnum.LowToHight.rawValue
        tableView.reloadData()
    }
    
    @IBAction func dismissView(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func apply(_ sender: UIButton) {
        
        delegate?.sort(self, sortCase: selectedSortIndex)
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - Main
class FilterViewController: UIViewController {
    
    @IBOutlet private weak var applyButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    
    private var sortCases =
        ["Price - Low to High",
         "Price - Hight to Low"]
    private var selectedSortIndex : Int = 0
    
    var delegate : FilterViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureApplyButton()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    private func configureApplyButton(){
        
        applyButton.layer.borderWidth = 3
        applyButton.layer.borderColor = UIColor.black.cgColor
        applyButton.layer.cornerRadius = 25.0
    }
    
}

//MARK: -UITableViewDelegate,UITableViewDataSource
extension FilterViewController : UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sortCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = sortCases[indexPath.row]
        
        if selectedSortIndex == indexPath.row {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedSortIndex = indexPath.row
        tableView.reloadData()
    }
    
    
}
