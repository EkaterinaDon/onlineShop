//
//  TabBarController.swift
//  GBShop
//
//  Created by Ekaterina on 2.05.21.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        tabBar.tintColor = .systemTeal
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.isTranslucent = false
        
        viewControllers = [
            createTabBarItem(tabBarTitle: "Пользователь", tabBarImage: "user", viewController: LoginViewController()),
            createTabBarItem(tabBarTitle: "Каталог", tabBarImage: "folders", viewController: ProductsViewController()),
            createTabBarItem(tabBarTitle: "Корзина", tabBarImage: "cart", viewController: BasketViewController())
        ]
    }
    
    func createTabBarItem(tabBarTitle: String, tabBarImage: String, viewController: UIViewController) -> UINavigationController {
            let navCont = UINavigationController(rootViewController: viewController)
            navCont.tabBarItem.title = tabBarTitle
            navCont.tabBarItem.image = UIImage(named: tabBarImage)

            navCont.navigationBar.tintColor = .systemBlue
            navCont.navigationBar.isTranslucent = false
            return navCont
        }

}
