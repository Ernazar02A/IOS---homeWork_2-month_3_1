//
//  NewPwrViewController.swift
//  IOS - homeWork_2-month_3
//
//  Created by MacBook Pro on 13/4/23.
//

import UIKit

class NewPwrViewController: UIViewController {
    
    @IBOutlet weak var errorPass: UILabel!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    
    var id: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        let color: UIColor = #colorLiteral(red: 0.6470588446, green: 0.6470588446, blue: 0.6470588446, alpha: 0.4804852214)
        let colorLine: CGColor = #colorLiteral(red: 0.8805750012, green: 0.8905246854, blue: 0.9118484855, alpha: 1)
        passwordTextField.placeholderColor(color: color)
        confirmPassTextField.placeholderColor(color: color)
        passwordTextField.addBottomBorder(color: colorLine)
        confirmPassTextField.addBottomBorder(color: colorLine)
        user.text = id
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        let check = checkAllTextField()
        let checkPass = checkInLikePassword()
        
        if checkPass && check {
            self.performSegue(withIdentifier: "newSuccess", sender: self)
        }
    }
    

    @IBAction func securePassButton(_ sender: UIButton) {
        passwordTextField.changeSecuryPassword(sender)
    }
    @IBAction func secureConfirmButton(_ sender: UIButton) {
        confirmPassTextField.changeSecuryPassword(sender)
    }

    func safePassword(sender: UIButton, textField: UITextField) {
        if textField.isSecureTextEntry {
            let image = UIImage(systemName: "eye.fill")
            sender.setImage(image, for: .normal)
            
            textField.isSecureTextEntry = false
        } else {
            let image = UIImage(systemName: "eye.slash.fill")
            sender.setImage(image, for: .normal)
            
            textField.isSecureTextEntry = true
        }
    }
    
    func checkInLikePassword() -> Bool {
        let password = passwordTextField.text
        let confirmPass = confirmPassTextField.text
        if password == confirmPass {
            errorPass.isHidden = true
            return true
        } else {
            errorPass.isHidden = false
            return false
        }
    }
    
    func checkAllTextField() -> Bool {
        let pass = passwordTextField.checkForEmptiness()
        let conf = confirmPassTextField.checkForEmptiness()
        
        
        if pass && conf {
            return true
        }
        return false
    }
}
