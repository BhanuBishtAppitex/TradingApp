//
//  SignupViewController.swift
//  TradingApp
//
//  Created by wOOx Technology on 10/11/22.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var termsAndConditionLabel: UILabel!
    @IBOutlet weak var alreadyHaveAccountLabel: UILabel!
    @IBOutlet weak var passwordTF: CustomTextFieldWithRightView!
    @IBOutlet weak var confirmPasswordTF: CustomTextFieldWithRightView!
    @IBOutlet weak var signupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInitialView()
    
    }
    
    func updateInitialView() {
        // updating button look
        signupButton.layer.cornerRadius = 10
        // updating textField
        passwordTF.addRightView()
        confirmPasswordTF.addRightView()
        // attributed text of t&c
        var text = "I agree with the Terms of services and Privacy Policy"
        var attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.foregroundColor, value: UIColor(named: C.Colors.accentColor) ?? .red, range: NSRange(location: 16, length: 18))
        attributedText.addAttribute(.foregroundColor, value: UIColor(named: C.Colors.accentColor) ?? .red, range: NSRange(location: 39, length: 13))
        termsAndConditionLabel.attributedText = attributedText
        // attributed text for already have acc.
        text = "Already have an account? Login"
        attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.foregroundColor, value: UIColor(named: C.Colors.accentColor) ?? .red, range: NSRange(location: 25, length: 5))
        alreadyHaveAccountLabel.attributedText = attributedText
        //gesture
        alreadyHaveAccountLabel.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(alreadyHaveAccountLabelPressed(sender:)))
        alreadyHaveAccountLabel.addGestureRecognizer(gesture)
    }

    //MARK: - Button press methods
    @objc
    func alreadyHaveAccountLabelPressed(sender: UILabel){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
        present(vc, animated: true)
    }
}
