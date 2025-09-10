//
//  TabBarController.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 10.09.25.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        let firstVC = UINavigationController(rootViewController: HomeController())
        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 1)
        
//        let secondVC = UINavigationController(rootViewController: SearchVC())
//        secondVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
//        
//        let thirdVC = UINavigationController(rootViewController: ActorVC())
//        thirdVC.tabBarItem = UITabBarItem(title: "Actors", image: UIImage(systemName: "person.crop.circle"), tag: 3)
//        
//        let fourthVC = UINavigationController(rootViewController: FavoritesVC())
//        fourthVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), tag: 4)
        
        viewControllers = [firstVC]
    }
}
