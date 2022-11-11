//
//  TradePageViewController.swift
//  TradingApp
//
//  Created by wOOx Technology on 11/11/22.
//

import UIKit

class TradePageViewController: UIViewController {
    
    private let cellForTopCV = CellForTopViewOfTradePage.identifierString
    private let nibForTopCV: UINib = CellForTopViewOfTradePage.nib
    private let dataForTopCV = ModelForTradeApp.ModelForTopCV.countries
    private let cellForMainTV = CellForMainViewOfTradingPage.identifierString
    private let nibForMainTV: UINib = CellForMainViewOfTradingPage.nib
    private let dataForMainTV = ModelForTradeApp.ModelForMainTV.self
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        topCollectionView.register(nibForTopCV, forCellWithReuseIdentifier: cellForTopCV)
        mainTableView.register(nibForMainTV, forCellReuseIdentifier: cellForMainTV)
        
    }
    
}


//MARK: - CollectionView delegate and data methods
extension TradePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataForTopCV.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellForTopCV, for: indexPath) as! CellForTopViewOfTradePage
        cell.mainLabel.text = dataForTopCV[indexPath.row]
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 0.7294117647, green: 0.537254902, blue: 0.3803921569, alpha: 1)
        cell.layer.cornerRadius = cell.frame.height/2
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let mainLabelWidth = 11*dataForTopCV[indexPath.row].count
        return CGSize(width: mainLabelWidth+44, height: 45)
    }
         
   
}

extension TradePageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataForMainTV.mainText.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellForMainTV, for: indexPath) as! CellForMainViewOfTradingPage
        let data = dataForMainTV
        let index = indexPath.section
        cell.mainLabel.text = data.mainText[index]
        cell.sellLabel.text = data.sellText[index]
        cell.buyLabel.text = data.buyText[index]
        cell.percentLabel.text = data.percentText[index]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 1)
        return view
    } 
}
