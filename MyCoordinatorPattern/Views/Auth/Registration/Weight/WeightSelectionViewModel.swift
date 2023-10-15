//
//  WeightSelectionViewModel.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 08/10/2023.
//

import Foundation

class WeightSelectionViewModel {
    
    // MARK: - Variables
    weak var coordinator: LogisterCoordinator?
    
    var user: User
    let pickerData: [String] = (50...125).map { String($0) }
    
    
    // MARK: - init
    init(coordinator: LogisterCoordinator? = nil, user: User) {
        self.coordinator = coordinator
        self.user = user
    }
    
    
    // MARK: - Navigation
    func weightSelectionAborted() {
        coordinator?.weightSelectionAborted(newUser: user)
    }
    
    func weightSelectionFinished() {
        coordinator?.weightSelectionFinished(newUser: user)
    }
}
