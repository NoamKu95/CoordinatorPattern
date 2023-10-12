//
//  LogisterCoordinator.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 04/10/2023.
//

import Foundation
import UIKit

final class LogisterCoordinator: ChildCoordinator {
    
    var parent: RootCoordinator?
    var viewControllerRef: UIViewController?
    var navigationController: UINavigationController
    
    
    // MARK: init & start
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool = false) {
        let viewModel = LoginViewModel(coordinator: self)
        let loginViewController = LoginViewController()
        loginViewController.viewModel = viewModel
        
        viewControllerRef = loginViewController
        navigationController.customPushViewController(viewController: loginViewController)
    }
    

    // MARK: dismiss coordinator
    func logisterSuccess(user: User) {
        coordinatorDidFinish()
        parent?.logisterFinished(user: user, animated: true)
    }

    func coordinatorDidFinish() {
        if let viewController = viewControllerRef as? DisposableViewController {
            viewController.cleanUp()
        }
        parent?.childDidFinish(self)
    }
}

// MARK: - Login
extension LogisterCoordinator {
    
    func navigateToLogin(navigationDirection: UINavigationController.VCTransition = .fromBottom) {
        let viewModel = LoginViewModel(coordinator: self)
        let loginViewController = LoginViewController()
        loginViewController.viewModel = viewModel
        
        viewControllerRef = loginViewController
        navigationController.customPushViewController(viewController: loginViewController, direction: navigationDirection)
    }
}

// MARK: - Forgot Password
extension LogisterCoordinator {
    
    func navigateToForgotPassword() {
        let viewModel = ForgotPasswordViewModel(coordinator: self)
        let forgotPasswordViewController = ForgotPasswordViewController()
        forgotPasswordViewController.viewModel = viewModel
        
        viewControllerRef = forgotPasswordViewController
        navigationController.customPushViewController(viewController: forgotPasswordViewController, direction: .fromLeft)
    }
    
    func forgotPasswordFinished() {
        navigateToLogin(navigationDirection: .fromRight)
    }
}

// MARK: - Registration Flow
extension LogisterCoordinator {
    
    // ±±± RegisterIntro ±±±
    func navigateToRegister(direction: UINavigationController.VCTransition = .fromRight) {
        let viewModel = RegistrationViewModel(coordinator: self)
        let registerViewController = RegisterViewController()
        registerViewController.viewModel = viewModel
        
        viewControllerRef = registerViewController
        navigationController.customPushViewController(viewController: registerViewController, direction: .fromLeft)
    }
    
    func registerIntroFinished(newUser: User) {
        navigateToGenderSelection(user: newUser)
    }
    
    // ±±± GenderSelection ±±±
    func navigateToGenderSelection(user: User, direction: UINavigationController.VCTransition = .fromRight) {
        let viewModel = GenderSelectionViewModel(coordinator: self, user: user)
        let genderSelectionViewController = GenderSelectionViewController()
        genderSelectionViewController.viewModel = viewModel
        
        viewControllerRef = genderSelectionViewController
        navigationController.customPushViewController(viewController: genderSelectionViewController, direction: direction)
    }
    
    func genderSelectionFinished(newUser: User) {
        navigateToHeightSelection(user: newUser)
    }
    
    func genderSelectionAborted() {
        navigateToRegister(direction: .fromLeft)
    }
    
    // ±±± HeightSelection ±±±
    func navigateToHeightSelection(user: User, direction: UINavigationController.VCTransition = .fromRight) {
        let viewModel = HeightSelectionViewModel(coordinator: self, user: user)
        let heightSelectionViewController = HeightSelectionViewController()
        heightSelectionViewController.viewModel = viewModel
        
        viewControllerRef = heightSelectionViewController
        navigationController.customPushViewController(viewController: heightSelectionViewController, direction: direction)
    }
    
    func heightSelectionFinished(newUser: User) {
        navigateToWeightSelection(user: newUser)
    }
    
    func heightSelectionAborted(newUser: User) {
        navigateToGenderSelection(user: newUser, direction: .fromLeft)
    }
    
    // ±±± WeightSelection ±±±
    func navigateToWeightSelection(user: User, direction: UINavigationController.VCTransition = .fromRight) {
        let viewModel = WeightSelectionViewModel(coordinator: self, user: user)
        let weightSelectionViewController = WeightSelectionViewController()
        weightSelectionViewController.viewModel = viewModel
        
        viewControllerRef = weightSelectionViewController
        navigationController.customPushViewController(viewController: weightSelectionViewController, direction: direction)
    }
    
    func weightSelectionFinished(newUser: User) {
        navigateToGoalsSelection(user: newUser)
    }
    
    func weightSelectionAborted(newUser: User) {
        navigateToHeightSelection(user: newUser, direction: .fromLeft)
    }
    
    // ±±± GoalsSelection ±±±
    func navigateToGoalsSelection(user: User, direction: UINavigationController.VCTransition = .fromRight) {
        let viewModel = GoalsSelectionViewModel(coordinator: self, user: user)
        let goalsSelectionViewController = GoalsSelectionViewController()
        goalsSelectionViewController.viewModel = viewModel
        
        viewControllerRef = goalsSelectionViewController
        navigationController.customPushViewController(viewController: goalsSelectionViewController, direction: direction)
    }
    
    func goalsSelectionFinished(newUser: User) {
        navigateToRegistrationSummary(user: newUser)
    }
    
    func goalsSelectionAborted(newUser: User) {
        navigateToWeightSelection(user: newUser, direction: .fromLeft)
    }
    
    // ±±± RegistrationSummary ±±±
    func navigateToRegistrationSummary(user: User, direction: UINavigationController.VCTransition = .fromRight) {
        let viewModel = RegistrationSummaryViewModel(coordinator: self, user: user)
        let registrationSummaryViewController = RegistrationSummaryViewController()
        registrationSummaryViewController.viewModel = viewModel
        
        viewControllerRef = registrationSummaryViewController
        navigationController.customPushViewController(viewController: registrationSummaryViewController, direction: direction)
    }
    
    func registrationSummaryAborted(newUser: User) {
        navigateToGoalsSelection(user: newUser, direction: .fromLeft)
    }
}

// MARK: - Terms & Conditions
extension LogisterCoordinator {
    
    func termsAndConditions() {
        parent?.showTermsAndConditions()
    }
}
