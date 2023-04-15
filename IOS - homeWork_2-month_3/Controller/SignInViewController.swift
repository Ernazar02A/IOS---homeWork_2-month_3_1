//
//  ViewController.swift
//  IOS - homeWork_2-month_3
//
//  Created by MacBook Pro on 12/4/23.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var views: UIView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        views.layer.cornerRadius = 40
        let color: UIColor = #colorLiteral(red: 0.6470588446, green: 0.6470588446, blue: 0.6470588446, alpha: 0.4804852214)
        let colorLine: CGColor = #colorLiteral(red: 0.8805750012, green: 0.8905246854, blue: 0.9118484855, alpha: 1)
        
        loginTextField.addBottomBorder(color: colorLine)
        loginTextField.placeholderColor(color: color)
        passwordTextField.addBottomBorder(color: colorLine)
        passwordTextField.placeholderColor(color: color)
        
    }
    
    @IBAction func secureButtonPressed(_ sender: UIButton) {
        passwordTextField.changeSecuryPassword(sender)
    }
    
    @IBAction func rememberBtnPressed(_ sender: UIButton) {
        let check = UIImage(systemName: "checkmark.square")
        let nocheck = UIImage(systemName: "square")
        let actualImage = sender.imageView?.image
        if actualImage == check {
            sender.setImage(nocheck, for: .normal)
        } else {
            sender.setImage(check, for: .normal)
        }
    }
    
    @IBAction func singInPressed(_ sender: UIButton) {
        let loginCheck = loginTextField.checkForEmptiness()
        let passCheck = passwordTextField.checkForEmptiness()
        
        
        if loginCheck && passCheck {
            self.performSegue(withIdentifier: "succes", sender: self)
        }
    }
    
    @IBAction func forgotBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "forgetSegue", sender: self)
    }
}


extension UITextField {
    
    func changeSecuryPassword(_ sender: UIButton) {
        if self.isSecureTextEntry {
            let image = UIImage(systemName: "eye.fill")
            sender.setImage(image, for: .normal)
            
            self.isSecureTextEntry = false
        } else {
            let image = UIImage(systemName: "eye.slash.fill")
            sender.setImage(image, for: .normal)
            
            self.isSecureTextEntry = true
        }
    }
    
    func checkForEmptiness() -> Bool {
        if self.text?.isEmpty == true {
            
            self.placeholder = "Заполните, пожалуйста"
            let color: UIColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 0.5)
            let colorLine: CGColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            self.placeholderColor(color: color)
            self.addBottomBorder(color: colorLine)
            return false
        } else {
            let color: UIColor = #colorLiteral(red: 0.6470588446, green: 0.6470588446, blue: 0.6470588446, alpha: 0.4804852214)
            let colorLine: CGColor = #colorLiteral(red: 0.8805750012, green: 0.8905246854, blue: 0.9118484855, alpha: 1)
            self.layer.borderColor = #colorLiteral(red: 0, green: 0.4470588235, blue: 0.8823529412, alpha: 0.04303413037)
            self.placeholder = "name"
            self.placeholderColor(color: color)
            self.addBottomBorder(color: colorLine)
            return true
        }
    }
    
    //for line bottom textField
    func addBottomBorder(color: CGColor){
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = color
            layer.addSublayer(bottomLine)
    }
    
    //for change color placeholder
    func placeholderColor(color: UIColor) {
        let placeholder = self.placeholder ?? "" //There should be a placeholder set in storyboard or elsewhere string or pass empty
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
    }

}
