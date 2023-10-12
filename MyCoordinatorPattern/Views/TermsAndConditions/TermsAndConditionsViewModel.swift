//
//  TermsAndConditionsViewModel.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 09/10/2023.
//

import Foundation

class TermsAndConditionsViewModel {
    
    // MARK: - Variables
    weak var coordinator: RootCoordinator?
    
    
    // MARK: - init
    init(coordinator: RootCoordinator?) {
        self.coordinator = coordinator
    }
    
    
    // MARK: - Navigation
    func dismissScreen() {
        coordinator?.termsAnConditionsFinished()
    }
}
