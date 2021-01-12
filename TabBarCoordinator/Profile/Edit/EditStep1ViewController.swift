//
//  EditStep1ViewController.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

class EditStep1ViewController: UIViewController {

    //MARK: Private Properties

    weak private var coordinator: EditCoordinator?

    //MARK: Instantiate

    static func instantiate(_ coordinator: EditCoordinator) -> EditStep1ViewController {
        let controller = EditStep1ViewController.instantiateFromStoryboard()
        controller.coordinator = coordinator
        
        return controller
    }
    
    //MARK: Override

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Actions

    @IBAction func editStep1Action(_ sender: Any) {
        coordinator?.startEditStep2()
    }
    
    

}
