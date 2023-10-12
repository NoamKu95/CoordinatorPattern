//
//  ProfileViewModel.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 08/10/2023.
//

import Foundation

class ProfileViewModel {
    
    // MARK: - Variables
    weak var coordinator: ProfileCoordinator?
    
    private var tasks: [Task<Void, Never>]?
    
    
    // MARK: - init
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }
    
    
    // MARK: - Navigation
    func termsAndConditions() {
        coordinator?.termsAndConditions()
    }
    
    
    // MARK: - cleanup
    deinit {
        tasks?.forEach{ $0.cancel() }
    }
}
