//
//  WelcomeViewController.swift
//  LoginTestApp
//
//  Created by Alexey Kiparin on 02.12.2024.
//
import UIKit

final class WelcomeViewController: UIViewController {
    
    var user: String?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(user ?? "")!"
    }
    @IBAction private func backToLoginViewAction() {
        dismiss(animated: true, completion: nil)
    }
    
}
