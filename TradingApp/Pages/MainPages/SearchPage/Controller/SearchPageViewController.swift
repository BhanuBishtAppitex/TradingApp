//
//  SearchPageViewController.swift
//  TradingApp
//
//  Created by wOOx Technology on 11/11/22.
//

import UIKit

class SearchPageViewController: UIViewController {

    @IBOutlet weak var searchTextFieldTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: CustomSearchTextField!
    @IBOutlet weak var tableView: UITableView!
    
    // for table view
    let data = ModelForSearchPage.self
    let identifier = CellForSearchPage.identifierString
    let nib = CellForSearchPage.nib
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchButton.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(nib, forCellReuseIdentifier: identifier)
        
    }
    
    //MARK: - button press methods
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut) {
            self.searchTextFieldTrailingConstraint.constant = 24
            self.searchButton.isHidden = true
            self.searchTextField.text = ""
        }

    }
}

//MARK: - TextField (serach) delegate methods
extension SearchPageViewController:UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut) {
            self.searchTextFieldTrailingConstraint.constant = 32+58+14
            self.searchButton.isHidden = false
        }
    }    
}

//MARK: - tableView delegate and data source methods
extension SearchPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.brandText.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CellForSearchPage
        let index = indexPath.section
        cell.brandLabel.text = data.brandText[index]
        cell.brandSubLabel.text = data.brandSubText[index]
        if data.comingSoonLabel[index] {
            
        }
        cell.priceLabel.text = data.priceText[index]
        cell.perventageLabel.text = data.percentText[index]
        if data.growth[index] {
            cell.priceLabel.textColor = .white
            if data.percentGrowth[index] {
                cell.perventageLabel.textColor = #colorLiteral(red: 0.2196078431, green: 0.5568627451, blue: 0.8980392157, alpha: 1)
            } else {
                cell.perventageLabel.textColor = #colorLiteral(red: 0.9176470588, green: 0.2588235294, blue: 0.3098039216, alpha: 1)
            }
        } else {
            cell.priceLabel.textColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
            cell.perventageLabel.textColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
        }
        
        if data.comingSoonLabel[index] {
            cell.commingSoonView.isHidden = false
            cell.leftSVCenterYConstraint.constant = -(19) // 7 for gap and 19 is height of commingSoonView
        }
       
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = EditWatchlistViewController()
        present(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
}
