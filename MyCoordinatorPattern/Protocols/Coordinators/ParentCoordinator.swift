//
//  ParentCoordinator.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 04/10/2023.
//

import Foundation

/// All coordinators that will hold sub-coordinator will conform to this protocol
protocol ParentCoordinator: Coordinator {
    
    /// Each Coordinator can have its own children coordinators (subcoordinators)
    var childCoordinators: [Coordinator] { get set }
    
    
    /**
     Adds given coordinator to the array of children.
     - Parameters:
        - child: A coordinator.
     */
    func addChildCoordinator(_ child: Coordinator?)
    
    
    /**
     Tells the parent coordinator that given sub-coordinator is done and should be removed from the array of children.
     - Parameters:
        - child: A coordinator
     */
    func childDidFinish(_ child: Coordinator?)
}

extension ParentCoordinator {
    
    /**
     Appends the coordinator to the children array.
     - Parameters:
        - child: The child coordinator to be appended to the list.
     */
    func addChildCoordinator(_ child: Coordinator?) {
        if let child {
            childCoordinators.append(child)
        }
    }
    
    /**
     Removes given child (sub-ccordinator) from children array.
     - Parameters:
        - child: The child coordinator to be removed from the list.
     */
    func childDidFinish(_ child: Coordinator?) {
        if let index = childCoordinators.firstIndex(where: { $0 === child }) {
            childCoordinators.remove(at: index)
        }
    }
}
