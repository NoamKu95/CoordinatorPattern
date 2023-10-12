//
//  LoginViewModel.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 07/10/2023.
//

import Foundation

class LoginViewModel {
    
    // MARK: - Variables
    weak var coordinator: LogisterCoordinator?
    var authRepository = AuthRepository()
    
    private var tasks: [Task<Void, Never>]?

    
    // MARK: - init
    init(coordinator: LogisterCoordinator) {
        self.coordinator = coordinator
    }
    
    
    // MARK: - Actions
    @MainActor
    func performLogin() {
        let task = Task {
            do {
                let user = try await authRepository.login()
                coordinator?.logisterSuccess(user: user)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        tasks?.append(task)
    }
    
    
    // MARK: - Navigation
    func navigateToForgotPassword() {
        coordinator?.navigateToForgotPassword()
    }
    
    func navigateToRegister() {
        coordinator?.navigateToRegister()
    }
    
    
    // MARK: - cleanup
    deinit {
        tasks?.forEach{ $0.cancel() }
    }
}
