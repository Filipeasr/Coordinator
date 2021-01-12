//
//  LoginCoordinator.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

final class LoginCoordinator: Coordinator {
    
    //MARK: Private properties
    
    weak private var parentCoordinator: AppCoordinator?
    weak private var window: UIWindow?
    
    //MARK: Init
    
    init(window: UIWindow, parenteCoordinator: AppCoordinator?) {
        self.window = window
        self.parentCoordinator = parenteCoordinator
        
        childCoordinators = []
    }
    
    //MARK: Coordinator

    var childCoordinators: [Coordinator]
    
    func start() {
        let loginController = LoginViewController.instantiate(self)
        
        window?.rootViewController = UINavigationController(rootViewController: loginController)
        window?.makeKeyAndVisible()
    }
}

extension LoginCoordinator {

    //MARK: Public methods
    
    func login() {
        parentCoordinator?.login()
    }
}
