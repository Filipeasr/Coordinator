//
//  FoodViewController.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

class FoodViewController: UIViewController {

    //MARK: Private Properties

    weak private var coordinator: FoodCoordinator?
    
    //MARK: Instantiate

    static func instantiate(_ coordinator: FoodCoordinator) -> FoodViewController {
        let controller = FoodViewController.instantiateFromStoryboard()
        controller.coordinator = coordinator
        
        return controller
    }
    
    //MARK: Override

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
       
        coordinator?.finishedFood()
    }
    
    //MARK: Actions

    @IBAction func foodDismissAction(_ sender: Any) {
        coordinator?.dismissFood()
    }
}
