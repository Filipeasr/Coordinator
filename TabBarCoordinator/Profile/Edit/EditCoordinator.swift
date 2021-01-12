//
//  EditCoordinator.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

final class EditCoordinator: NSObject, Coordinator {
    
    //MARK: Private Properties

    weak private var parentCoordinator: ProfileCoordinator?
    private var editNavigationController: UINavigationController?
    weak private var contentViewController: UIViewController?

    //MARK: Init

    init(contentViewController: UIViewController, parentCoordinator: ProfileCoordinator?) {
        self.contentViewController = contentViewController
        self.childCoordinators = []
        self.parentCoordinator = parentCoordinator
    }
   
    //MARK: Coordinator
    
    var childCoordinators: [Coordinator]
    
    func start() {
        let editStep1Controller = EditStep1ViewController.instantiate(self)

        editNavigationController = UINavigationController(rootViewController: editStep1Controller)
        editNavigationController?.presentationController?.delegate = self
        if let editNavigationController = editNavigationController {
            editNavigationController.navigationBar.barTintColor = UIColor.green
            
            contentViewController?.present(editNavigationController, animated: true, completion: nil)
        }
    }
}

extension EditCoordinator {
    
    //MARK: Public methods

    func startEditStep2() {
        let editStep2Controller = EditStep2ViewController.instantiate(self)

        editNavigationController?.pushViewController(editStep2Controller, animated: true)
    }
    
    func finishedEdit() {
        parentCoordinator?.backToHome()
        parentCoordinator?.childDidFinish(self)
        contentViewController?.dismiss(animated: true, completion: nil)
    }
}

//MARK: UIAdaptivePresentationControllerDelegate

extension EditCoordinator: UIAdaptivePresentationControllerDelegate {
    
    //Notifies the delegate after a presentation is dismissed.
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        parentCoordinator?.childDidFinish(self)
    }
}
