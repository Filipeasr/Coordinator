//
//  HomeStep2ViewController.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

class HomeStep2ViewController: UIViewController {
  
    //MARK: Private Properties

    weak private var coordinator: HomeCoordinator?

    //MARK: Instantiate

    static func instantiate(_ coordinator: HomeCoordinator) -> HomeStep2ViewController {
        let controller = HomeStep2ViewController.instantiateFromStoryboard()
        controller.coordinator = coordinator
        
        return controller
    }
    
    //MARK: Override

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Actions

    @IBAction func detailStep2Action(_ sender: Any) {
        coordinator?.backHome()
    }
}
