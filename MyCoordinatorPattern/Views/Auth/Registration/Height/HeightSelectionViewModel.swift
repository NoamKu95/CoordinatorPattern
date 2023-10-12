//
//  HeightSelectionViewModel.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 08/10/2023.
//

import Foundation

class HeightSelectionViewModel {
        
    // MARK: - Variables
    weak var coordinator: LogisterCoordinator?
    
    var user: User
    
    
    // MARK: - init
    init(coordinator: LogisterCoordinator? = nil, user: User) {
        self.coordinator = coordinator
        self.user = user
    }
    
    
    // MARK: - Navigation
    func heightSelectionAborted() {
        coordinator?.heightSelectionAborted(newUser: user)
    }
    
    func heightSelectionFinished() {
        coordinator?.heightSelectionFinished(newUser: user)
    }
}
