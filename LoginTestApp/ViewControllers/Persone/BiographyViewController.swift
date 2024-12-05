//
//  BiographyViewController.swift
//  LoginTestApp
//
//  Created by Alexey Kiparin on 05.12.2024.
//

import UIKit

final class BiographyViewController: UIViewController {

    @IBOutlet weak var biographyLable: UILabel!
    
    var biographyText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        biographyLable.text = biographyText ?? ""
    }
}
