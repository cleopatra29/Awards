//
//  LoginController.swift
//  Awards
//
//  Created by Terretino on 15/09/19.
//  Copyright © 2019 Terretino. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    let emailList = EmailList()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let listOfEmail = emailList.getEmail()
        let alertController = UIAlertController(title: "Oops!", message: "Incorrect E-mail", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(OKAction)
        
        if listOfEmail.contains(emailTextField.text!){
            performSegue(withIdentifier: "GoToMainPage", sender: nil)
        } else {
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
