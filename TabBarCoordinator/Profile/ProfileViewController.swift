//
//  ProfileViewController.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: Private Properties
    
    weak private var coordinator: ProfileCoordinator?
    
    //MARK: Instantiate

    static func instantiate(_ coordinator: ProfileCoordinator) -> ProfileViewController {
        let controller = ProfileViewController.instantiateFromStoryboard()
        controller.coordinator = coordinator
        
        return controller
    }
    
    //MARK: Override

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: IBAction

    @IBAction func profileAction(_ sender: Any) {
        coordinator?.startEditStep1()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLogged")//just for example

        coordinator?.logout()
    }
}
