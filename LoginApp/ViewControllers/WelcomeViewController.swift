//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Matvei Khlestov on 12.05.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: -  Public Properties
    var user: User!
    
    // MARK: -  Private Properties
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    // MARK: -  UI Elements
    private lazy var palmLabel: UILabel = {
        let label = UILabel()
        label.text = user.person.emoji
        label.font = UIFont.systemFont(ofSize: 58)
        
        return label
    }()
    
    private lazy var logoutButton: UIButton = {
        var attributes = AttributeContainer()
        attributes.font = .systemFont(ofSize: 20)
        attributes.foregroundColor = .white
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.attributedTitle = AttributedString("Log Out", attributes: attributes)
        
        let button = UIButton(
            configuration: buttonConfiguration,
            primaryAction: UIAction { [unowned self] _ in
                logoutButtonPressed()
            })
        
        return button
    }()
    
    // MARK: -  Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: -  Private Methods
extension WelcomeViewController {
    private func configure() {
        view.addVerticalGradientLayer(
            topColor: primaryColor,
            bottomColor: secondaryColor
        )
        
        setupNavigationController()
        
        setupSubviews(
            palmLabel,
            logoutButton
        )
        
        setConstraints()
    }
    
    private func setupNavigationController() {
        title = "Welcome, \(user.person.name)!"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
    }
    
    private func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
    
    private func logoutButtonPressed() {
        dismiss(animated: true)
    }
}

// MARK: -  Constraints
extension WelcomeViewController {
    private func setConstraints() {
        palmLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                palmLabel.centerXAnchor.constraint(
                    equalTo: view.centerXAnchor
                ),
                palmLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150
                )
            ]
        )
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                logoutButton.centerXAnchor.constraint(
                    equalTo: view.centerXAnchor
                ),
                logoutButton.bottomAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                    constant: -150
                )
            ]
        )
    }
}
