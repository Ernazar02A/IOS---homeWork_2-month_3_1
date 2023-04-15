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
        passwordTextField.changeSecuryPassword(sender)
    }
    @IBAction func secureConfirmButton(_ sender: UIButton) {
        confirmPassTextField.changeSecuryPassword(sender)
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
    
    func checkAllTextField() -> Bool {
        let user = userNameTextField.checkForEmptiness()
        let email = emailTextField.checkForEmptiness()
        let number = numberTextField.checkForEmptiness()
        let name = fullNameTextField.checkForEmptiness()
        let pass = passwordTextField.checkForEmptiness()
        let conf = confirmPassTextField.checkForEmptiness()
        
        if user && email && number && name && pass && conf {
            return true
        }
        return false
    }
}


