//
//  RegistrationViewModel.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 07/10/2023.
//

import Foundation
import UIKit

class RegistrationViewModel {
    
    // MARK: - Variables
    weak var coordinator: LogisterCoordinator?
    
    var user: User?
    
    
    // MARK: - init
    init(coordinator: LogisterCoordinator) {
        self.coordinator = coordinator
    }
    
    
    // MARK: - navigation
    func termsAndConditions() {
        coordinator?.termsAndConditions()
    }
    
    func navigateToLogin() {
        coordinator?.navigateToLogin()
    }
    
    func registerIntroFinished() {
        coordinator?.registerIntroFinished(newUser: User())
    }
}
