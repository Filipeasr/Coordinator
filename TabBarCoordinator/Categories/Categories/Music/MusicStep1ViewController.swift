//
//  MusicStep1ViewController.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

class MusicStep1ViewController: UIViewController {

    //MARK: Private Properties

    weak private var coordinator: MusicCoordinator?
    
    //MARK: Instantiate

    static func instantiate(_ coordinator: MusicCoordinator) -> MusicStep1ViewController {
        let controller = MusicStep1ViewController.instantiateFromStoryboard()
        controller.coordinator = coordinator
        
        return controller
    }
    
    //MARK: Override
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
