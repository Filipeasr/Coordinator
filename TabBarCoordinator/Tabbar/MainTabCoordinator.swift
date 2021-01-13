//
//  MainTabCoordinator.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

final class MainTabCoordinator: Coordinator {
    
    //MARK: Private properties
    
    weak private var parentCoordinator: AppCoordinator?
    weak private var window: UIWindow?

    private var tabBarController: UITabBarController

    //MARK: Init
    
    init(window: UIWindow, parenteCoordinator: AppCoordinator?) {
        self.window = window
        self.tabBarController = MainTabController()
        self.parentCoordinator = parenteCoordinator
        
        childCoordinators = []
    }
    
    //MARK: Coordinator

    var childCoordinators: [Coordinator]
    
    func start() {
        let homeCoordinator = HomeCoordinator(navigation: UINavigationController(), parentCoordinator: self)
        homeCoordinator.start()
        addChild(homeCoordinator)
        
        let categoriesCoordinator = CategoriesCoordinator(navigation: UINavigationController(), parentCoordinator: self)
        categoriesCoordinator.start()
        addChild(categoriesCoordinator)

        let profileCoordinator = ProfileCoordinator(navigation: UINavigationController(), parentCoordinator: self)
        profileCoordinator.start()
        addChild(profileCoordinator)
        
        tabBarController.setViewControllers([homeCoordinator.currentNavigationController(),
                                            categoriesCoordinator.currentNavigationController(),
                                            profileCoordinator.currentNavigationController()], animated: true)
        
        tabBarController.tabBar.isTranslucent = true
        
        window?.rootViewController = self.tabBarController
        window?.makeKeyAndVisible()
    }
}

extension MainTabCoordinator {
    
    //MARK: Public methods

    func navigateToHome()  {
        if let homeCoordinator = childCoordinators[0] as? HomeCoordinator {
            homeCoordinator.popToRootViewController()
        }
        tabBarController.selectedIndex = 0
    }
    
    func navigateToHomeDeep() {
        if let homeCoordinator = childCoordinators[0] as? HomeCoordinator {
            homeCoordinator.startDetailStep2Deep()
        }
        tabBarController.selectedIndex = 0
    }
    
    func logout() {
        parentCoordinator?.logout()
    }
}
