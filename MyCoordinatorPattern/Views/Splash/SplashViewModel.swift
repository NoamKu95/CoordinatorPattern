//
//  SplashViewModel.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 07/10/2023.
//

import Foundation

class SplashViewModel {
    
    // MARK: - Variables
    var coordinator: RootCoordinator
    
    
    // MARK: - init
    init(coordinator: RootCoordinator) {
        self.coordinator = coordinator
    }
    
    
    // MARK: - Functions
    func isUserConnected() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    
    // MARK: - Navigation
    func removeSpashScreen() {
        coordinator.navigateFromSplashVc(isLoggedIn: isUserConnected(), user: User())
    }
}
