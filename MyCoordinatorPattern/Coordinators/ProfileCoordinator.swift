//
//  ProfileCoordinator.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 05/10/2023.
//

import Foundation
import UIKit

final class ProfileCoordinator: ParentCoordinator, ChildCoordinator {
   
    var parent: RootCoordinator?
    var childCoordinators = [Coordinator]()
    var viewControllerRef: UIViewController?
    var navigationController: UINavigationController
    
    
    // MARK: init & start
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool = false) {
        let viewModel = ProfileViewModel(coordinator: self)
        let profileViewController = ProfileViewController()
        profileViewController.viewModel = viewModel
        
        viewControllerRef = profileViewController
        profileViewController.tabBarItem = UITabBarItem(title: "Profile",
                                                        image: UIImage(systemName: "person.crop.circle"),
                                                        selectedImage: nil)
        navigationController.customPushViewController(viewController: profileViewController)
    }
    
    
    // MARK: - dismiss coordinator
    func coordinatorDidFinish() {
        if let viewController = viewControllerRef as? DisposableViewController {
            viewController.cleanUp()
        }
        parent?.childDidFinish(self)
    }
}

// MARK: - Terms & Conditions
extension ProfileCoordinator {
    
    func termsAndConditions() {
        parent?.showTermsAndConditions()
    }
}
