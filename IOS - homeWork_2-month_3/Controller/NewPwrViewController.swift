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
        safePassword(sender: sender, textField: passwordTextField)
    }
    @IBAction func secureConfirmButton(_ sender: UIButton) {
        safePassword(sender: sender, textField: confirmPassTextField)
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
        let pass = checkForEmptiness(textField: passwordTextField)
        let conf = checkForEmptiness(textField: confirmPassTextField)
        
        if pass && conf {
            return true
        }
        return false
    }
    
    func checkForEmptiness(textField: UITextField) -> Bool{
        if textField.text?.isEmpty == true {
            
            textField.placeholder = "Заполните, пожалуйста"
            let color: UIColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 0.5)
            let colorLine: CGColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            textField.placeholderColor(color: color)
            textField.addBottomBorder(color: colorLine)
            return false
        } else {
            let color: UIColor = #colorLiteral(red: 0.6470588446, green: 0.6470588446, blue: 0.6470588446, alpha: 0.4804852214)
            let colorLine: CGColor = #colorLiteral(red: 0.8805750012, green: 0.8905246854, blue: 0.9118484855, alpha: 1)
            textField.layer.borderColor = #colorLiteral(red: 0, green: 0.4470588235, blue: 0.8823529412, alpha: 0.04303413037)
            textField.placeholder = "name"
            textField.placeholderColor(color: color)
            textField.addBottomBorder(color: colorLine)
            return true
        }
    }
}
