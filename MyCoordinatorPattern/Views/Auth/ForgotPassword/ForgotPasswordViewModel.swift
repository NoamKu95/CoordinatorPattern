//
//  ForgotPasswordViewModel.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 07/10/2023.
//

import Foundation

class ForgotPasswordViewModel {
    
    // MARK: - Variables
    weak var coordinator: LogisterCoordinator?
    var authRepository = AuthRepository()
    
    private var tasks: [Task<Void, Never>]?
    
    
    // MARK: - init
    init(coordinator: LogisterCoordinator) {
        self.coordinator = coordinator
    }
    
    
    // MARK: - Functions
    @MainActor
    func sendNewPassword() {
        let task = Task {
            do {
                try await authRepository.sendNewPassword()
                forgotPasswordFinished()
            } catch let error {
                print(error.localizedDescription)
            }
        }
        tasks?.append(task)
    }
    
    
    // MARK: - Navigation
    private func forgotPasswordFinished() {
        coordinator?.forgotPasswordFinished()
    }
}
