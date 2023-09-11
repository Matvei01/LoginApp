//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by Matvei Khlestov on 20.05.2022.
//

import UIKit

final class AboutMeViewController: UIViewController {
    
    // MARK: -  Public Properties
    var user: User!
    
    // MARK: -  UI Elements
    private lazy var moreInfoButton: UIButton = {
        var attributes = AttributeContainer()
        attributes.font = .systemFont(ofSize: 20)
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.attributedTitle = AttributedString("Photo", attributes: attributes)
        
        let button = UIButton(
            configuration: buttonConfiguration,
            primaryAction: UIAction { [unowned self] _ in
                moreInfoPressed()
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
extension AboutMeViewController {
    private func configure() {
        view.backgroundColor = .white
        
        setupNavigationController()
        
        setupSubviews(moreInfoButton)
        
        setConstraints()
    }
    
    private func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
    
    private func setupNavigationController() {
        title = user.person.fullName
    }
    
    private func moreInfoPressed() {
        let imageMeVC = ImageViewController()
        imageMeVC.user = user
        navigationController?.pushViewController(imageMeVC, animated: true)
    }
}

// MARK: -  Constraints
extension AboutMeViewController {
    private func setConstraints() {
        moreInfoButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                moreInfoButton.centerYAnchor.constraint(
                    equalTo: view.centerYAnchor
                ),
                moreInfoButton.centerXAnchor.constraint(
                    equalTo: view.centerXAnchor
                )
            ]
        )
    }
}

