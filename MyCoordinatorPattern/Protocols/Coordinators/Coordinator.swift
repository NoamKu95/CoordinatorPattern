//
//  Coordinator.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 02/10/2023.
//

import Foundation
import UIKit

/// Coordinator handles navigation within the app
protocol Coordinator: AnyObject {

    var navigationController: UINavigationController { get set }
    
    /**
     The Coordinator activates itself.
     - Parameters:
        - animated: Set the value to true to animate the transition. Set to false if no need to animate the transition or if setting up a navigation controller before its view is displayed.
     */
    func start(animated: Bool)
    
    
    /**
     Pops the active View Controller from the navigation stack.
    - Parameters:
        - animated: Set this value to true to animate the transition.
     */
    func popViewController(animated: Bool, useCustomAnimation: Bool, transitionType: CATransitionType)
}

extension Coordinator {
    
    /**
     Pops the top view controller from the navigation stack and updates the display.
     - Parameters:
        - animated: Set this value to true to animate the transition.
        - useCustomAnimation: Set to true if you want a transition from top to bottom.
     */
    func popViewController(animated: Bool,
                           useCustomAnimation: Bool = false,
                           transitionType: CATransitionType = .push
    ){
        if useCustomAnimation {
            navigationController.customPopViewController(transitionType: transitionType)
        } else {
            navigationController.popViewController(animated: animated)
        }
    }
    
    
    /**
     Pops view controllers until the specified view controller is at the top of the navigation stack.
     - Parameters:
        - ofClass: The view controller that you want to be at the top of the stack. This view controller must currently be on the navigation stack.
        - animated: Set this value to true to animate the transition.
     */
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        navigationController.popToViewController(ofClass: ofClass, animated: animated)
    }
    
    
    /**
     Pops view controllers until the specified view controller is at the top of the navigation stack.
     - Parameters:
        - viewController: The view controller that you want to be at the top of the stack. This view controller must currently be on the navigation stack.
        - animated: Set the value to true to animate the transition.
        - useCustomAnimation: Set to true if you want a transition from top to the bottom.
     */
    func popViewController(to viewController: UIViewController,
                           animated: Bool,
                           useCustomAnimation: Bool,
                           transitionType: CATransitionType = .push
    ){
        if useCustomAnimation {
            navigationController.customPopToViewController(viewController: viewController, transitionType: transitionType)
        } else {
            navigationController.popToViewController(viewController, animated: animated)
        }
    }
}
