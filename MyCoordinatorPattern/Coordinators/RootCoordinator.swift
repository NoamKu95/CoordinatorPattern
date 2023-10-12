//
//  RootCoordinator.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 04/10/2023.
//

import Foundation
import UIKit

final class RootCoordinator: NSObject, ParentCoordinator {
    
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    
    // MARK: - init & start
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let viewModel = SplashViewModel(coordinator: self)
        let fakeSplashVC = SplashScreenViewController()
        fakeSplashVC.viewModel = viewModel
        navigationController.pushViewController(fakeSplashVC, animated: animated)
    }
}

extension RootCoordinator {
    
    // MARK: - nav From
    func navigateFromSplashVc(isLoggedIn: Bool, user: User? = nil) {
        if let user, isLoggedIn {
            navigateToApp(userData: user)
        } else {
            navigateToLogister()
        }
    }

    
    // MARK: - nav To
    private func navigateToApp(userData: User) {
        let baseTabBarController = BaseTabBarController(currentUser: userData, coordinator: self)
        baseTabBarController.coordinator = self
        navigationController.pushViewController(baseTabBarController, animated: true)
    }
    
    private func navigateToLogister() {
        let logisterCoordinator = LogisterCoordinator(navigationController: navigationController)
        logisterCoordinator.parent = self
        addChildCoordinator(logisterCoordinator)
        logisterCoordinator.start(animated: true)
    }
    
    func showTermsAndConditions() {
        let viewModel = TermsAndConditionsViewModel(coordinator: self)
        let termsConditionsViewController = TermsAndConditionsViewController()
        termsConditionsViewController.viewModel = viewModel
        
        termsConditionsViewController.modalPresentationStyle = .overCurrentContext
        navigationController.present(termsConditionsViewController, animated: true)
    }
    
    
    // MARK: - flow Finished
    func logisterFinished(user: User, animated: Bool) {
        navigateToApp(userData: user)
    }
    
    func termsAnConditionsFinished() {
        navigationController.topViewController?.dismiss(animated: true)
    }
}
