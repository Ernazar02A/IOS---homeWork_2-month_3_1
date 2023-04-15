//
//  PasswordViewController.swift
//  IOS - homeWork_2-month_3
//
//  Created by MacBook Pro on 12/4/23.
//

import UIKit

class PasswordViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var smsTextField: UITextField!
    
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let color: CGColor = #colorLiteral(red: 0.6470588446, green: 0.6470588446, blue: 0.6470588446, alpha: 0.4804852214)
        idTextField.addBottomBorder(color: color)
        
        button()
    }
    
    @IBAction func checkId(_ sender: UIButton) {
        let result = idTextField.checkForEmptiness()
        if result {
            smsTextField.isEnabled = true
        }
    }
    @IBAction func checkSms(_ sender: UIButton) {
        if smsTextField.text?.isEmpty == false {
            self.performSegue(withIdentifier: "changeSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? NewPwrViewController
        vc?.id = idTextField.text
    }
    
    
    func button() {
        for i in buttons {
            i.layer.borderWidth = 1
        }
    }

}
