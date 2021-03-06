//
//  EditStep2ViewController.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

class EditStep2ViewController: UIViewController {

    //MARK: Private Properties

    weak private var coordinator: EditCoordinator?

    //MARK: Instantiate

    static func instantiate(_ coordinator: EditCoordinator) -> EditStep2ViewController {
        let controller = EditStep2ViewController.instantiateFromStoryboard()
        controller.coordinator = coordinator
        
        return controller
    }
    
    //MARK: Override

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: Actions

    @IBAction func editStep2Action(_ sender: Any) {
        coordinator?.finishedEdit()
    }
}
