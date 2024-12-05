//
//  PersonViewController.swift
//  LoginTestApp
//
//  Created by Alexey Kiparin on 05.12.2024.
//

import UIKit

final class PersonViewController: UIViewController {
    
    @IBOutlet weak var userIconImageView: UIImageView!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        userIconImageView.layer.cornerRadius = userIconImageView.frame.height / 2
        userIconImageView.clipsToBounds = true
        
        surnameLabel.text = person?.surname ?? ""
        nameLabel.text = person?.name ?? ""
        ageLabel.text = String(person?.adge ?? 1)
        emailLabel.text = person?.email ?? ""
        phoneLabel.text = person?.phone ?? ""
        birthdayLabel.text = " \(dateFormatter.string(from: person?.birthday ?? Date())) года"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let biographyVC = segue.destination as? BiographyViewController {
            biographyVC.biographyText = person?.bio ?? ""
        }
    }
}
