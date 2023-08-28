//
//  ImageViewController.swift
//  LoginApp
//
//  Created by Matvei Khlestov on 21.05.2022.
//

import UIKit

class ImageViewController: UIViewController {
    
    var user: User?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.image = UIImage(named: user?.person.image ?? "apple")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                imageView.centerYAnchor.constraint(
                    equalTo: view.centerYAnchor
                ),
                imageView.centerXAnchor.constraint(
                    equalTo: view.centerXAnchor
                )
            ]
        )
    }
}
