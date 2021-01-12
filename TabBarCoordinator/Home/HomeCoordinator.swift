//
//  HomeCoordinator.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
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
        let homeController = HomeViewController.instantiate(self)

        navigationController.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(systemName: "house.fill"), tag: 0)
        navigationController.setViewControllers([homeController], animated: true)
    }
}

extension HomeCoordinator {
    
    //MARK: Public methods

    func startDetailStep1() {
        let homeStep1Controller = HomeStep1ViewController.instantiate(self)
        
        navigationController.pushViewController(homeStep1Controller, animated: true)
    }
    
    func startDetailStep2() {
        let homeStep2Controller = HomeStep2ViewController.instantiate(self)
        
        navigationController.pushViewController(homeStep2Controller, animated: true)
    }
    
    func startDetailStep2Deep() {
        navigationController.popToRootViewController(animated: false)
        let homeStep1Controller = HomeStep1ViewController.instantiate(self)
        let homeStep2Controller = HomeStep2ViewController.instantiate(self)
        
        navigationController.setViewControllers([navigationController.viewControllers.first!, homeStep1Controller, homeStep2Controller], animated: false)
    }
    
    func backHome() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func currentNavigationController() -> UINavigationController {
        return navigationController
    }
    
    func popToRootViewController(_ animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }
}
