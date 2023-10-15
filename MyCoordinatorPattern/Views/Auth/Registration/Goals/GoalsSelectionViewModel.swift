//
//  GoalsSelectionViewModel.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 08/10/2023.
//

import Foundation

class GoalsSelectionViewModel {
    
    // MARK: - Variables
    weak var coordinator: LogisterCoordinator?
    
    var user: User
    var tableData: [String] = ["Goal 1", "Goal 2", "Goal 3"]
    
    
    // MARK: - init
    init(coordinator: LogisterCoordinator? = nil, user: User) {
        self.coordinator = coordinator
        self.user = user
    }
    
    
    // MARK: - Navigation
    func goalsSelectionAborted() {
        coordinator?.goalsSelectionAborted(newUser: user)
    }
    
    func goalsSelectionFinished() {
        coordinator?.goalsSelectionFinished(newUser: user)
    }
}
