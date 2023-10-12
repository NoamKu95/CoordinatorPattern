//
//  RegistrationSummaryViewModel.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 08/10/2023.
//

import Foundation

class RegistrationSummaryViewModel {
    
    // MARK: - variables
    weak var coordinator: LogisterCoordinator?
    var repository = AuthRepository()
    private var tasks: [Task<Void, Never>]?
    
    var user: User

    
    // MARK: - init
    init(coordinator: LogisterCoordinator? = nil, user: User) {
        self.coordinator = coordinator
        self.user = user
    }
    
    
    // MARK: - Functions
    @MainActor
    func performRegistration() {
        let task = Task {
            do {
                let createdUser = try await repository.register(newUser: user)
                coordinator?.logisterSuccess(user: createdUser)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        tasks?.append(task)
    }
    
    
    // MARK: - Navigation
    func registrationSummaryAborted() {
        coordinator?.registrationSummaryAborted(newUser: user)
    }
    
    
    // MARK: - cleanup
    deinit {
        tasks?.forEach{ $0.cancel() }
    }
}
