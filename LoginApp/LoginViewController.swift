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
    private let userName = "user"
    private let password = "ios"
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.login = loginTF.text
    }
    
    // MARK: - IBActions
    
    @IBAction func loginTapped() {
        if loginTF.text != userName || passwordTF.text != password {
                showAlert(
                    title: "Invalid login or password",
                    message: "Please, enter correct login and password"
                )
        }
    }
    
    @IBAction func alertLoginTapped() {
        showAlert(title: "Oops!", message: "Your login is user")
    }
    
    @IBAction func alertPasswordTapped() {
        showAlert(title: "Oops!", message: "Your password is ios")
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


