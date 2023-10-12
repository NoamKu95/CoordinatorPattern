//
//  ChildCoordinator.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 04/10/2023.
//

import UIKit

/// All Child coordinators (a coordinator held under another coordinator) should conform to this protocol
protocol ChildCoordinator: Coordinator {
    
    /** The body of this function should call `childDidFinish(_ child:)` on the parent coordinator to remove the child from the parent's `childCoordinators` array. */
    func coordinatorDidFinish()
    
    /// A reference to the view controller currently used in the coordinator.
    var viewControllerRef: UIViewController? {get set}
}
