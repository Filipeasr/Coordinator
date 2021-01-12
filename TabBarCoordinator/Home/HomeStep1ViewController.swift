//
//  HomeStep1ViewController.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

class HomeStep1ViewController: UIViewController {

    //MARK: Private Properties

    weak private var coordinator: HomeCoordinator?

    //MARK: Instantiate

    static func instantiate(_ coordinator: HomeCoordinator) -> HomeStep1ViewController {
        let controller = HomeStep1ViewController.instantiateFromStoryboard()
        controller.coordinator = coordinator
        
        return controller
    }
    
    //MARK: Override

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Actions

    @IBAction func detailStep1Action(_ sender: Any) {
        coordinator?.startDetailStep2()
    }
}
