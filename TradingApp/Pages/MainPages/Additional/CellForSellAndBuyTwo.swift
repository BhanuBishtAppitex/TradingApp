//
//  CellForSellAndBuyTwo.swift
//  TradingApp
//
//  Created by wOOx Technology on 14/11/22.
//

import UIKit

class CellForSellAndBuyTwo: UICollectionViewCell {
    
    static let identifier: String = "CellForSellAndBuyTwo"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    @IBOutlet weak var mainImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImage.tintColor = .white
    }

}
