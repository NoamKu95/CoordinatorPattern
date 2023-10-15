//
//  BaseTabBarController.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 05/10/2023.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    // MARK: - Variables
    weak var coordinator: RootCoordinator?
    
    private let homepageCoordinator = HomepageCoordinator(navigationController: UINavigationController())
    private let profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
    
    
    // MARK: - init
    init(currentUser: User, coordinator: RootCoordinator) {
        self.coordinator = coordinator
        homepageCoordinator.parent = coordinator
        profileCoordinator.parent = coordinator
        super.init(nibName: "BaseTabBarController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        for item in [homepageCoordinator, profileCoordinator] {
            coordinator?.addChildCoordinator(item as? Coordinator)
        }
        
        homepageCoordinator.start()
        profileCoordinator.start()
        
        viewControllers = [
            homepageCoordinator.navigationController,
            profileCoordinator.navigationController
        ]
    }
}
