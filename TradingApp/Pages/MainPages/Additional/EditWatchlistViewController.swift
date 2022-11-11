//
//  EditWatchlistViewController.swift
//  TradingApp
//
//  Created by wOOx Technology on 11/11/22.
//

import UIKit

class EditWatchlistViewController: UIViewController {
    
    @IBOutlet weak var stepperText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInitialView()
        
    }
    
    func updateInitialView(){
        
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIButton) {
        
        sender.transform = CGAffineTransform(scaleX: 2.6, y: 2.6)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
            sender.transform = CGAffineTransform.identity
        },
                       completion: { Void in()  }
        )
        
        // 1 for minus, 2 for plus
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut) {
            if sender.tag == 1{
                print("minus")
                if let value = Int(self.stepperText.text!) {
                    print("value: \(value)")
                    if value > 0 && value <= 10 {
                        let newValue = value-1
                        self.stepperText.text = String(newValue)
                    }
                }
            } else {
                print("plus")
                if let value = Int(self.stepperText.text!) {
                    if value >= 0 && value < 10 {
                        let newValue = value+1
                        self.stepperText.text = String(newValue)
                    }
                }
            }
        }
    }
    
    
    
    
}
