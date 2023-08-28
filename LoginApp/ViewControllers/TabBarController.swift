//
//  TabBarController.swift
//  LoginApp
//
//  Created by Matvei Khlestov on 01.08.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    private func generateTabBar() {
        let welcomeViewController = UINavigationController(
            rootViewController: WelcomeViewController()
        )
        let aboutMeViewController = UINavigationController(
            rootViewController: AboutMeViewController()
        )
        
        viewControllers = [
            generateVC(
                viewController: welcomeViewController,
                title: "Home",
                image: UIImage(systemName: "house.fill")
            ),
            generateVC(
                viewController: aboutMeViewController,
                title: "About me",
                image: UIImage(systemName: "person.fill")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        return viewController
    }
}
