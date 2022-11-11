//
//  CellForAccountPage.swift
//  TradingApp
//
//  Created by wOOx Technology on 11/11/22.
//

import UIKit

class CellForAccountPage: UITableViewCell {
    
    
    //MARK: - identifier and nib
    static let identifierString: String = "CellForAccountPage"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var rightArrow: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
       updateView()
    }
    
    func updateView() {
        rightSwitch.isHidden = true
        rightLabel.isHidden = true
        rightArrow.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
