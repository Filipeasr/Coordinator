//
//  FoodCoordinator.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

final class FoodCoordinator: Coordinator {
    
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
        let foodViewController = FoodViewController.instantiate(self)
        
        navigationController.present(foodViewController, animated: true, completion: nil)
    }
}

extension FoodCoordinator {

    //MARK: Public methods

    func dismissFood() {

        navigationController.dismiss(animated: true, completion: nil)
    }
    
    func finishedFood() {
        parentCoordinator?.childDidFinish(self)
    }
}
