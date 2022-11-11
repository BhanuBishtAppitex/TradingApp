//
//  AccountPageViewController.swift
//  TradingApp
//
//  Created by wOOx Technology on 11/11/22.
//

import UIKit

class AccountPageViewController: UIViewController {
    
    @IBOutlet weak var switchToDemoTableView: UITableView!
    @IBOutlet weak var mainTableView: UITableView!
    
    private let dataForSwitchToDemoTV =  ModelForAccountPage.ModelForSwitchToDemo.self
    private let dataForMainTV = ModelForAccountPage.ModelForMainTV.self
    private let identifier = CellForAccountPage.identifierString
    private let nib = CellForAccountPage.nib
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchToDemoTableView.register(nib, forCellReuseIdentifier: identifier)
        mainTableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
}

//MARK: - Table view data source/ delegate methods
extension AccountPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == switchToDemoTableView {
            return 1
        } else {
            return dataForMainTV.mainText.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CellForAccountPage
        let index = indexPath.section
        cell.rightArrow.isHidden = false
        if tableView == switchToDemoTableView {
            print("inside switchToDemo")
            let data = dataForSwitchToDemoTV
            cell.mainImage.image = UIImage(named: data.mainImage)
            cell.mainText.text = data.mainText
        } else if tableView == mainTableView {
            let data = dataForMainTV
            cell.mainImage.image = UIImage(named: data.mainImage[index])
            cell.mainText.text = data.mainText[index]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if dataForMainTV.mainText[indexPath.section] == "Settings" {
            let vc = SettingPageViewController()
            present(vc, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
       
        return view
    }
    
    
}
