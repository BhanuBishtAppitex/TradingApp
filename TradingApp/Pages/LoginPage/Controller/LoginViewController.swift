//
//  ViewController.swift
//  TradingApp
//
//  Created by wOOx Technology on 10/11/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: CustomTextFieldWithRightView!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInitailView()
    }
    
    func updateInitailView(){
        // updating button look
        loginButton.layer.cornerRadius = 10
        // updating text field right view
        passwordTextField.addRightView()
        let text = "Don't have an account? Sign Up"
        // attributed string
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.foregroundColor, value: UIColor(named: C.Colors.accentColor) ?? UIColor.red, range: NSRange(location: 22, length: 8))
        dontHaveAccountLabel.attributedText = attributedString
        dontHaveAccountLabel.isUserInteractionEnabled = true
        // adding gesture to label
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.dontHaveAccountLabelPressed(sender:)))
        dontHaveAccountLabel.addGestureRecognizer(gesture)
      
        
    }
    
    //MARK: - Button press methods
    @objc
    func dontHaveAccountLabelPressed(sender: UILabel){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignupViewController")
        present(vc, animated: true)
    }


}

