//
//  CustomTextFieldWithRightView.swift
//  TradingApp
//
//  Created by wOOx Technology on 10/11/22.
//

import UIKit

class CustomTextFieldWithRightView: UITextField {
    
    private var isSecure: Bool = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateView()
    }
    
    func updateView() {
        self.layer.borderWidth = 2
        self.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.125)
    }
    
    func addRightView() {
        // right view
        let iconView = UIButton(frame:
                       CGRect(x: 0, y: 0, width: 40, height: 40))
        iconView.setImage(UIImage(systemName:  "eye"), for: .normal)
        iconView.tintColor = .white
        iconView.addTarget(self, action: #selector(self.rightViewClicked(sender:)), for: .touchUpInside)
        let iconContainerView: UIView = UIView(frame:
                       CGRect(x: 20, y: 0, width: 40, height: 40))
        iconContainerView.addSubview(iconView)
        
        rightView = iconContainerView
        rightViewMode = .always
    }
    
    @objc
    func rightViewClicked(sender: UIButton){
        if isSecure {
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
            self.isSecureTextEntry = false
            isSecure = false
        } else {
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            self.isSecureTextEntry = true
            isSecure = true
        }
    }

}
