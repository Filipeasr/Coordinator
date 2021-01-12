//
//  HomeViewController.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

class HomeViewController: UIViewController {
   
    //MARK: Private Properties

    weak private var coordinator: HomeCoordinator?

    //MARK: Instantiate

    static func instantiate(_ coordinator: HomeCoordinator) -> HomeViewController {
        let controller = HomeViewController.instantiateFromStoryboard()
        controller.coordinator = coordinator
        
        return controller
    }
    
    //MARK: Override

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: IBAction

    @IBAction func homeAction(_ sender: Any) {
        coordinator?.startDetailStep1()
    }
}
