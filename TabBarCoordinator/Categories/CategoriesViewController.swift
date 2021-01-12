//
//  CategoriesViewController.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

class CategoriesViewController: UIViewController {

    //MARK: Private Properties

    weak private var coordinator: CategoriesCoordinator?
    
    //MARK: Instantiate

    static func instantiate(_ coordinator: CategoriesCoordinator) -> CategoriesViewController {
        let controller = CategoriesViewController.instantiateFromStoryboard()
        controller.coordinator = coordinator
        
        return controller
    }
    
    //MARK: Override

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Action
    
    @IBAction func musicAction(_ sender: Any) {
        coordinator?.startMusic()
    }
    
    @IBAction func foodAction(_ sender: Any) {
        coordinator?.startFood()
    }
    
    @IBAction func changeTabAction(_ sender: Any) {
        coordinator?.changeTabHomeDeep()
    }
}
