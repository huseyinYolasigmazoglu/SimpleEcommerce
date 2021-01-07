//
//  FilterViewController.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 27.12.2020.
//

import UIKit


//MARK: -protocol
protocol FilterViewControllerDelegate {
    
    func sort(_ filterDelegate: FilterViewController,sortCase: SortEnum)
}

//MARK: -IBActions
extension FilterViewController {
    
    @IBAction private func clear(_ sender: Any) {
        
        selectedSortEnum = SortEnum.lowToHigh
        tableView.reloadData()
    }
    
    @IBAction private func dismissView(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func apply(_ sender: UIButton) {
        
        delegate?.sort(self, sortCase: selectedSortEnum )
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - Main
class FilterViewController: UIViewController {
    
    @IBOutlet private weak var applyButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    
    private var sortCases =
        ["Price - Low to High",
         "Price - High to Low",
         "Date - Newest",
         "Date - Oldest",
         "None",
         "Show price as EUR",
         "Show price as GBP"]
    
    //var selectedSortIndex : Int = 0
    var selectedSortEnum   = SortEnum.lowToHigh
    var delegate : FilterViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureApplyButton()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    private func configureApplyButton() {
        
        applyButton.layer.borderWidth = 3
        applyButton.layer.borderColor = UIColor.black.cgColor
        applyButton.layer.cornerRadius = 25.0
    }
    
}

//MARK: -UITableViewDelegate,UITableViewDataSource
extension FilterViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sortCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = sortCases[indexPath.row]
        
        if selectedSortEnum.rawValue == indexPath.row {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //selectedSortIndex = indexPath.row
        selectedSortEnum = SortEnum(rawValue: indexPath.row) ?? SortEnum.lowToHigh
        tableView.reloadData()
    }
    
}
