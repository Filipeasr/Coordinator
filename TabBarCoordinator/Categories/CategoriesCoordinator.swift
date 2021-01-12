//
//  CategoriesCoordinator.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

final class CategoriesCoordinator: Coordinator {
    
    //MARK: Private Properties
    
    weak private var parentCoordinator: MainTabCoordinator?
    private var navigationController: UINavigationController
    
    //MARK: Init
    
    init(navigation: UINavigationController, parentCoordinator: MainTabCoordinator?) {
        self.navigationController = navigation
        self.childCoordinators = []
        self.parentCoordinator = parentCoordinator
    }
    
    //MARK: Coordinator
    
    var childCoordinators: [Coordinator]
    
    func start() {
        let categoriesViewController = CategoriesViewController.instantiate(self)
        
        navigationController.tabBarItem = UITabBarItem(title: "CATEGORIES", image: UIImage(systemName: "rectangle.3.offgrid.fill"), tag: 1)
        navigationController.pushViewController(categoriesViewController, animated: true)
    }
    
}

extension CategoriesCoordinator {
    
    //MARK: Public methods

    func startMusic() {
        let musicCoordinator = MusicCoordinator(navigation: navigationController, parentCoordinator: self)
        musicCoordinator.start()
        addChild(musicCoordinator)
    }
    
    func startFood() {
        let foodCoordinator = FoodCoordinator(navigation: navigationController, parentCoordinator: self)
        foodCoordinator.start()
        addChild(foodCoordinator)
    }
    
    func changeTabHomeDeep() {
        parentCoordinator?.navigateToHomeDeep()
        
    }
    
    func childDidFinish(_ childCoordiator: Coordinator) {
        removeChild(childCoordiator)
    }
    
    func currentNavigationController() -> UINavigationController {
        return navigationController
    }
}
