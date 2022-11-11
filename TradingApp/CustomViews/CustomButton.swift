//
//  CustomButton.swift
//  TradingApp
//
//  Created by wOOx Technology on 11/11/22.
//

import UIKit

class CustomButton: UIButton {

    //MARK: - @IBInspectable
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var textFont: UIFont = UIFont() {
        didSet {
            self.titleLabel?.font = textFont
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var highlightedBackgroundColor :UIColor?
       @IBInspectable var nonHighlightedBackgroundColor :UIColor?
    override var isHighlighted :Bool {
           get {
               return super.isHighlighted
           }
           set {
               if newValue {
                   self.backgroundColor = highlightedBackgroundColor
               }
               else {
                   self.backgroundColor = nonHighlightedBackgroundColor
               }
               super.isHighlighted = newValue
           }
       }
    
    @IBInspectable var selectedBackgroundColor :UIColor?
       @IBInspectable var nonSelectedBackgroundColor :UIColor?
    override var isSelected: Bool  {
           get {
               return super.isSelected
           }
           set {
               if newValue {
                   self.backgroundColor = selectedBackgroundColor
               }
               else {
                   self.backgroundColor = nonSelectedBackgroundColor
               }
               super.isHighlighted = newValue
           }
       }


}
