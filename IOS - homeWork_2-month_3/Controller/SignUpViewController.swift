//
//  SignUpViewController.swift
//  IOS - homeWork_2-month_3
//
//  Created by MacBook Pro on 12/4/23.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    
    @IBOutlet weak var errorPass: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let color: UIColor = #colorLiteral(red: 0.6470588446, green: 0.6470588446, blue: 0.6470588446, alpha: 0.4804852214)
        let colorLine: CGColor = #colorLiteral(red: 0.8805750012, green: 0.8905246854, blue: 0.9118484855, alpha: 1)
        fullNameTextField.addBottomBorder(color: colorLine)
        numberTextField.addBottomBorder(color: colorLine)
        emailTextField.addBottomBorder(color: colorLine)
        userNameTextField.addBottomBorder(color: colorLine)
        passwordTextField.addBottomBorder(color: colorLine)
        confirmPassTextField.addBottomBorder(color: colorLine)
        fullNameTextField.placeholderColor(color: color)
        numberTextField.placeholderColor(color: color)
        emailTextField.placeholderColor(color: color)
        userNameTextField.placeholderColor(color: color)
        passwordTextField.placeholderColor(color: color)
        confirmPassTextField.placeholderColor(color: color)
    }
    
    @IBAction func securePassButton(_ sender: UIButton) {
        safePassword(sender: sender, textField: passwordTextField)
    }
    @IBAction func secureConfirmButton(_ sender: UIButton) {
        safePassword(sender: sender, textField: confirmPassTextField)
    }
    
    
    
    @IBAction func singUpBtnPressed(_ sender: UIButton) {
        let check = checkAllTextField()
        let checkPass = checkInLikePassword()
        
        if checkPass && check {
            self.performSegue(withIdentifier: "upSuccess", sender: self)
        }
    }
    
    @IBAction func backSingIn(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
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
    
    func checkAllTextField() -> Bool {
        let user = checkForEmptiness(textField: userNameTextField)
        let email = checkForEmptiness(textField: emailTextField)
        let number = checkForEmptiness(textField: numberTextField)
        let name = checkForEmptiness(textField: fullNameTextField)
        let pass = checkForEmptiness(textField: passwordTextField)
        let conf = checkForEmptiness(textField: confirmPassTextField)
        
        if user && email && number && name && pass && conf {
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

