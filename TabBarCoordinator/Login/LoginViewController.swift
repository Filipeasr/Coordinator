//
//  LoginViewController.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: Private Properties

    weak private var coordinator: LoginCoordinator?

    //MARK: Instantiate

    static func instantiate(_ coordinator: LoginCoordinator) -> LoginViewController {
        let controller = LoginViewController.instantiateFromStoryboard()
        controller.coordinator = coordinator
        
        return controller
    }

    //MARK: Override

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Action

    @IBAction func loginAction(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "isLogged")//just for example
        
        coordinator?.login()
    }
}
