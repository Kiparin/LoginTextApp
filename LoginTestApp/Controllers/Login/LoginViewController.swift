//
//  ViewController.swift
//  LoginTestApp
//
//  Created by Alexey Kiparin on 02.12.2024.
//

import UIKit

final class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let password: String = "123"
    private let user: String = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard loginTextField.text == user, passwordTextField.text == password else {
            let alert = UIAlertController(
                title: "Invalid login or password",
                message: "Please try again",
                preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
                self.passwordTextField.text = ""
            }
            alert.addAction(okAction)
            self.present(alert, animated: true)
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? WelcomeViewController {
            destinationVC.user = user
        }
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    @IBAction private func forgotUserNameAction() {
        viewAlert("Forgot username", user)
    }
    
    @IBAction private func forgotPasswordAction() {
        viewAlert("Forgot password", password)
    }
    
    private func viewAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

