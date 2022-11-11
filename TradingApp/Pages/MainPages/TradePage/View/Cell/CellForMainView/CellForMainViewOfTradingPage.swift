//
//  CellForMainViewOfTradingPage.swift
//  TradingApp
//
//  Created by wOOx Technology on 11/11/22.
//

import UIKit

class CellForMainViewOfTradingPage: UITableViewCell {
    
    //MARK: - identifier string and nib
    static let identifierString: String = "CellForMainViewOfTradingPage"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var sellLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var buyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
