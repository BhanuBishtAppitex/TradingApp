//
//  PortfolioPageViewController.swift
//  TradingApp
//
//  Created by wOOx Technology on 11/11/22.
//

import UIKit

class PortfolioPageViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sepratorView: UIView!
    @IBOutlet weak var sepratorViewLeadingConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    
    //MARK: - buttonPress methods
    @IBAction func segmentedControllerButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut) {
            if sender.tag == 1 {
                self.sepratorViewLeadingConstraint.constant = 0
                self.collectionView.contentOffset.x = 0
            } else if sender.tag == 2 {
                self.sepratorViewLeadingConstraint.constant = self.sepratorView.frame.width
                self.collectionView.contentOffset.x = self.collectionView.frame.width
            } else {
                self.sepratorViewLeadingConstraint.constant = self.sepratorView.frame.width*2
                self.collectionView.contentOffset.x = self.collectionView.frame.width*2
            }
        }
    }
    
    


}

//MARK: - CollectionView delegate/datasource methods

extension PortfolioPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TradesCellForPortFolioPage", for: indexPath)
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrdersCellForPortFolioPage", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlertCellForPortFolioPage", for: indexPath)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

//MARK: - scrollView methods
extension PortfolioPageViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut) {
            self.sepratorViewLeadingConstraint.constant =    CGFloat(scrollView.contentOffset.x/3)
        }
        
        if scrollView.contentOffset.x < 0 {
            scrollView.contentOffset.x = 0
        } else if scrollView.contentOffset.x > self.view.frame.width*2 {
            scrollView.contentOffset.x = self.view.frame.width*2
        }

    }
}
