//
//  MainTabBarController.swift
//  TradingApp
//
//  Created by wOOx Technology on 10/11/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    @IBOutlet weak var mainTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1)
        NSLayoutConstraint.activate([
           // tabBar.heightAnchor.constraint(equalToConstant: 73)
        ])
    }
    


}
