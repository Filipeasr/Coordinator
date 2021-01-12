//
//  ProfileCoordinator.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
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
        let profileController = ProfileViewController.instantiate(self)
        
        navigationController.tabBarItem = UITabBarItem(title: "PROFILE", image: UIImage(systemName: "person.fill"), tag: 2)
        navigationController.setViewControllers([profileController], animated: true)
    }
}

extension ProfileCoordinator {

    //MARK: Public methods

    func startEditStep1() {
        let editCoordinator = EditCoordinator(contentViewController: navigationController, parentCoordinator: self)
        editCoordinator.start()
        addChild(editCoordinator)
    }
    
    func backToHome() {
        parentCoordinator?.navigateToHome()
    }
    
    func childDidFinish(_ childCoordiator: Coordinator) {
        removeChild(childCoordiator)
    }
    
    func currentNavigationController() -> UINavigationController {
        return navigationController
    }
    
    func logout() {
        parentCoordinator?.logout()
    }
}
