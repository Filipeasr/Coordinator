//
//  MusicViewController.swift
//  TabBarCoordinator
//
//  Created by Filipe Rosa.
//

import UIKit

class MusicViewController: UIViewController {

    //MARK: Private Properties

    weak private var coordinator: MusicCoordinator?
    
    //MARK: Instantiate

    static func instantiate(_ coordinator: MusicCoordinator) -> MusicViewController {
        let controller = MusicViewController.instantiateFromStoryboard()
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.tabBarController?.tabBar.isHidden = false
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        coordinator?.finishedMusic()
    }
    
    //MARK: Actions

    @IBAction func musicStep1Action(_ sender: Any) {
        coordinator?.startMusicStep1()
    }
}
