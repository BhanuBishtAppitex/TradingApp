//
//  CellForTopViewOfTradePage.swift
//  TradingApp
//
//  Created by wOOx Technology on 11/11/22.
//

import UIKit

class CellForTopViewOfTradePage: UICollectionViewCell {
    
    static let identifierString: String = "CellForTopViewOfTradePage"
    @IBOutlet weak var mainLabel: UILabel!
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainLabel.sizeToFit()

        
    }

}
