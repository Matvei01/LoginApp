//
//  ImageViewController.swift
//  LoginApp
//
//  Created by Matvei Khlestov on 21.05.2022.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 2
        }
    }
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: user.person.image)
    }
}
