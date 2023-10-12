//
//  HomepageViewModel.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 07/10/2023.
//

import Foundation

class HomepageViewModel {
    
    // MARK: - Variables
    weak var coordinator: HomepageCoordinator?
    
    private var tasks: [Task<Void, Never>]?
    
    
    // MARK: - init
    init(coordinator: HomepageCoordinator) {
        self.coordinator = coordinator
    }
    
    
    // MARK: - cleanup
    deinit {
        tasks?.forEach{ $0.cancel() }
    }
}
