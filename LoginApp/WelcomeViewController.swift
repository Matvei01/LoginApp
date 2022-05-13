//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Matvei Khlestov on 12.05.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    var login: String!
    @IBOutlet weak var labelWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelWelcome.text = "Welcome, \(String(login))!"
    }
}
