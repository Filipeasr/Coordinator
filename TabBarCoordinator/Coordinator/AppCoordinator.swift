//
//  AppCoordinator.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

class AppCoordinator: Coordinator {
    
    //MARK: Private Properties

    weak private var parentCoordinator: Coordinator?
    weak private var window: UIWindow?

    //MARK: Init

    init(window: UIWindow) {
        self.window = window
        self.childCoordinators = []
    }
    
    //MARK: Coordinator
    
    var childCoordinators: [Coordinator]

    func start() {
        
        if isLoged() {
            startMainTabBar()
        } else {
            startLogin()
        }
    }
}

extension AppCoordinator {

    //MARK: Public methods

    func login() {
        removeAllChildren()
        startMainTabBar()
    }
    
    func logout() {
        removeAllChildren()
        startLogin()
    }

    //MARK: Private methods

    private func startLogin() {
        guard let appWindow = window else { return }

        let loginCoordinator = LoginCoordinator(window: appWindow, parenteCoordinator: self)
        addChild(loginCoordinator)
        loginCoordinator.start()
    }
    
    private func startMainTabBar() {
        guard let appWindow = window else { return }
        
        let tabbarCoordinator = MainTabCoordinator(window: appWindow, parenteCoordinator: self)
        addChild(tabbarCoordinator)
        tabbarCoordinator.start()
    }
    
    private func isLoged() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLogged")
    }
}
