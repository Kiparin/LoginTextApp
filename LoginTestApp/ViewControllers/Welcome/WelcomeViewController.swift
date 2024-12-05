//
//  WelcomeViewController.swift
//  LoginTestApp
//
//  Created by Alexey Kiparin on 02.12.2024.
//
import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(user?.login ?? "")!"
        personLabel.text = "My name is \(user?.person.surname ?? "") \(user?.person.name ?? "")."
    }
    
    @IBAction private func backToLoginViewAction() {
        dismiss(animated: true, completion: nil)
    }
    
}
