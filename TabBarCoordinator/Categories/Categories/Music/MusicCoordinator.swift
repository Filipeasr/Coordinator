//
//  MusicCoordinator.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

final class MusicCoordinator: Coordinator {
    
    //MARK: Private Properties
    
    weak private var parentCoordinator: CategoriesCoordinator?
    private var navigationController: UINavigationController
    
    //MARK: Init

    init(navigation: UINavigationController, parentCoordinator: CategoriesCoordinator?) {
        self.navigationController = navigation
        self.childCoordinators = []
        self.parentCoordinator = parentCoordinator
    }
   
    //MARK: Coordinator

    var childCoordinators: [Coordinator]

    func start() {
        let musicViewController = MusicViewController.instantiate(self)

        navigationController.pushViewController(musicViewController, animated: true)
    }
}

extension MusicCoordinator {
    
    //MARK: Public methods

    func startMusicStep1() {
        let musicStep1Controller = MusicStep1ViewController.instantiate(self)
        navigationController.pushViewController(musicStep1Controller, animated: true)
    }
    
    func finishedMusic() {
        parentCoordinator?.childDidFinish(self)
    }
}
