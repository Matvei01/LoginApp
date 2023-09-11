//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Matvei Khlestov on 12.05.2022.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: -  Private Properties
    private let user = User.getUserData()
    
    // MARK: -  UI Elements
    private lazy var mainStackView: UIStackView = {
        createStackView(
            axis: .vertical,
            distribution: .fill,
            spacing: 20
        )
    }()
    
    private lazy var authorizationStackView: UIStackView = {
        createStackView(
            axis: .vertical,
            distribution: .fill,
            spacing: 20
        )
    }()
    
    private lazy var forgotStackView: UIStackView = {
        createStackView(
            axis: .horizontal,
            distribution: .equalSpacing,
            spacing: 0
        )
    }()
    
    private lazy var userNameTF: UITextField = {
        createTextField(placeholder: "User Name")
    }()
    
    private lazy var passwordTF: UITextField = {
        createTextField(placeholder: "Password")
    }()
    
    private lazy var loginButton: UIButton = {
        createButton(
            withTitle: "Log In",
            andFont: .systemFont(ofSize: 20),
            action: UIAction { [unowned self] _ in
                logInButtonPressed()
            })
    }()
    
    private lazy var forgotUserNameButton: UIButton = {
        createButton(
            withTitle: "Forgot User Name?",
            andFont: .systemFont(ofSize: 13),
            action: UIAction { [unowned self] _ in
                forgotUserNamePressed()
            })
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        createButton(
            withTitle: "Forgot Password?",
            andFont: .systemFont(ofSize: 13),
            action: UIAction { [unowned self] _ in
                forgotPasswordPressed()
            })
    }()
    
    // MARK: -  Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: -  Private Methods
extension LoginViewController {
    private func configure() {
        view.backgroundColor = .white
        
        setupSubviews(
            mainStackView,
            authorizationStackView,
            forgotStackView
        )
        
        setupSubviewsFor(
            mainStackView,
            subviews: authorizationStackView, loginButton, forgotStackView
        )
        
        setupSubviewsFor(
            authorizationStackView,
            subviews: userNameTF, passwordTF
        )
        
        setupSubviewsFor(
            forgotStackView,
            subviews: forgotUserNameButton, forgotPasswordButton
        )
        
        setConstraints()
    }
    
    private func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
    
    private func setupSubviewsFor(_ stackView: UIStackView, subviews: UIView...) {
        for subview in subviews {
            stackView.addArrangedSubview(subview)
        }
    }
    
    private func createStackView(axis: NSLayoutConstraint.Axis,
                                 distribution: UIStackView.Distribution,
                                 spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = .fill
        stackView.distribution = distribution
        stackView.spacing = spacing
        
        return stackView
    }
    
    private func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        
        return textField
    }
    
    private func createButton(withTitle title: String,
                              andFont font: UIFont,
                              action: UIAction) -> UIButton {
        var attributes = AttributeContainer()
        attributes.font = font
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.attributedTitle = AttributedString(
            title, attributes: attributes
        )
        
        let button = UIButton(
            configuration: buttonConfiguration,
            primaryAction: action
        )
        
        return button
    }
    
    private func logInButtonPressed() {
        if userNameTF.text != user.login || passwordTF.text != user.password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTF
            )
            
            return
            
        } else {
            let tabBarController = TabBarController()
            let viewControllers = tabBarController.viewControllers
            
            viewControllers?.forEach({ viewController in
                if let navController = viewController as? UINavigationController {
                    if let welcomeVC = navController.topViewController as? WelcomeViewController {
                        welcomeVC.user = user
                    } else if let aboutMeVC = navController.viewControllers.last as? AboutMeViewController {
                        aboutMeVC.user = user
                    }
                }
            })
            
            tabBarController.modalPresentationStyle = .fullScreen
            present(tabBarController, animated: true)
        }
    }
    
    private func forgotUserNamePressed() {
        showAlert(title: "Oops!", message: "Your name is \(user.login) 😉")
    }
    
    private func forgotPasswordPressed() {
        showAlert(title: "Oops!", message: "Your password is \(user.password) 😉")
    }
}

// MARK: -  Constraints
extension LoginViewController {
    private func setConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                mainStackView.centerYAnchor.constraint(
                    equalTo: view.centerYAnchor
                ),
                mainStackView.leadingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                    constant: 40
                ),
                mainStackView.trailingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                    constant: -40
                )
            ]
        )
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
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
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        
        return true
    }
}


