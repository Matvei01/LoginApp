//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Matvei Khlestov on 12.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    // MARK: - Private Properties
    private let user = User.getUser()
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                guard let aboutMeVC = navigationVC.topViewController as? AboutMeViewController else { return }
                aboutMeVC.user = user
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func loginTapped() {
        if loginTF.text != user.login || passwordTF.text != user.password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password"
            )
        }
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your login is \(user.login) 😉")
        : showAlert(title: "Oops!", message: "Your password is \(user.password) 😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - Private Methods
extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginTapped()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        
        return true
    }
}


