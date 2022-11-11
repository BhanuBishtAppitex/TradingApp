//
//  SettingPageViewController.swift
//  TradingApp
//
//  Created by wOOx Technology on 11/11/22.
//

import UIKit

class SettingPageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - data, cell, identifier for tableView
    let data = ModelForSettingPage.self
    let nib = CellForAccountPage.nib
    let identifier = CellForAccountPage.identifierString
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
}

//MARK: - table view delegate/ data source methods
extension SettingPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.mainText.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CellForAccountPage
        let index = indexPath.section
        cell.mainImage.image = UIImage(named: data.mainImage[index])
        cell.mainText.text = data.mainText[index]
        if data.rightImage[index] {
            cell.rightArrow.isHidden = false
        }
        if data.rightText[index] != "na" {
            print("rightText: \(data.rightText[index])")
            cell.rightLabel.text = data.rightText[index]
            cell.rightLabel.isHidden = false
        } else if data.rightSwitch[index] {
            cell.rightSwitch.isHidden = false
            cell.rightSwitch.isOn = false
            if data.rightSwitchEnable[index] {
                cell.rightSwitch.isOn = true
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
}
