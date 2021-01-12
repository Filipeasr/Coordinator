//
//  Coordinator.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    
    func start()
    func addChild(_ coordinator: Coordinator)
    func removeChild(_ coordinator: Coordinator)
    func removeAllChildren()
}

extension Coordinator {
    
    func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
    
    func removeAllChildren() {
        childCoordinators.removeAll()
    }
}
