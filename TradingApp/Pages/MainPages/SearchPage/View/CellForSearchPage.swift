//
//  CellForSearchPage.swift
//  TradingApp
//
//  Created by wOOx Technology on 11/11/22.
//

import UIKit

class CellForSearchPage: UITableViewCell {
    // identifier and nib
    static let identifierString: String = "CellForSearchPage"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    // iboutlests
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var brandSubLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var perventageLabel: UILabel!
    // need this constraint to move position upward wehn comming soon view will appear
    @IBOutlet weak var leftSVCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var commingSoonView: CustomCornerRadiusView!
    
    // view methods
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func updateView() {
        mainView.layer.cornerRadius = 10
        commingSoonView.isHidden = true
        
    }
    
}
