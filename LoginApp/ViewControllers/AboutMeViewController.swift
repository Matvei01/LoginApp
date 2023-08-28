//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by Matvei Khlestov on 20.05.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    var user: User?
    
    private lazy var moreInfoButton: UIButton = {
        var attributes = AttributeContainer()
        attributes.font = .systemFont(ofSize: 20)
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.baseBackgroundColor = .systemBlue
        buttonConfiguration.attributedTitle = AttributedString("Photo", attributes: attributes)
        
        let button = UIButton(
            configuration: buttonConfiguration,
            primaryAction: UIAction { [unowned self] _ in
                moreInfoPressed()
            })
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        
        setupSubviews(moreInfoButton)
        
        setConstraints()
        
        setupNavigationController()
    }
    
    private func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
    
    private func setupNavigationController() {
        title = user?.person.fullName ?? "nihuya"
    }
    
    private func moreInfoPressed() {
        let imageMeVC = ImageViewController()
        imageMeVC.user = user
        navigationController?.pushViewController(imageMeVC, animated: true)
    }
    
    private func setConstraints() {
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
