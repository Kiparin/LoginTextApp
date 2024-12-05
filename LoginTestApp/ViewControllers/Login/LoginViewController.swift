//
//  ViewController.swift
//  LoginTestApp
//
//  Created by Alexey Kiparin on 02.12.2024.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loginTextField.text = user.login
        passwordTextField.text = user.password
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard loginTextField.text == user.login, passwordTextField.text == user.password else {
            viewAlertAction(
                "Invalid login or password",
                "Please try again",
                {
                    self.passwordTextField.text = ""
                }
            )
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarVC = segue.destination as? UITabBarController
        
        tabBarVC?.viewControllers?.forEach { viewController in
            if let wecomeVC = viewController as? WelcomeViewController {
                wecomeVC.user = user
            }
            else if let navigationVC = viewController as? UINavigationController {
                let personeVC = navigationVC.topViewController as? PersonViewController
                personeVC?.person = user.person
            }
        }
    }
    
    @IBAction private func forgotUserNameAction() {
        viewAlertAction("Forgot username", user.login)
    }
    
    @IBAction private func forgotPasswordAction() {
        viewAlertAction("Forgot password", user.password)
    }
    
    private func viewAlertAction(_ title: String, _ message: String,_ alertAction: (() -> Void)? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
            alertAction?()
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}

extension LoginViewController : UITextFieldDelegate  {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            if shouldPerformSegue(withIdentifier: "tabBarSegue", sender: self) {
                performSegue(withIdentifier: "tabBarSegue", sender: self)
            }
        }
        return true
    }
}
