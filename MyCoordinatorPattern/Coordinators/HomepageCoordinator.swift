//
//  HomepageCoordinator.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 05/10/2023.
//

import Foundation
import UIKit

final class HomepageCoordinator: ChildCoordinator {
    
    var parent: RootCoordinator?
    var viewControllerRef: UIViewController?
    var navigationController: UINavigationController
    
    
    // MARK: init & start
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool = false) {
        let viewModel = HomepageViewModel(coordinator: self)
        let homepageViewController = HomepageViewController()
        homepageViewController.viewModel = viewModel
        
        viewControllerRef = homepageViewController
        homepageViewController.tabBarItem = UITabBarItem(title: "Homepage",
                                                         image: UIImage(systemName: "house.fill"),
                                                         selectedImage: nil)
        navigationController.pushViewController(homepageViewController, animated: false)
    }
    
    
    // MARK: - dismiss coordinator
    func coordinatorDidFinish() {
        if let viewController = viewControllerRef as? DisposableViewController {
            viewController.cleanUp()
        }
        parent?.childDidFinish(self)
    }
}
