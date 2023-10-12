//
//  NavigationControllerExt.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 02/10/2023.
//

import Foundation
import UIKit

private let _durationTime: CFTimeInterval = 0.25

public extension UINavigationController {
    
    enum VCTransition {
        case fromTop
        case fromBottom
        case fromLeft
        case fromRight
    }

    
    // MARK: POP VC
    /** Pops current view controller to previous view controller with a custom transition. */
    func customPopViewController(direction: VCTransition = .fromTop, transitionType: CATransitionType = .push) {
        self.addTransition(transitionDirection: direction, transitionType: transitionType)
        self.popViewController(animated: false)
    }
    
    
    // MARK: POP TO VC
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
      if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
        popToViewController(vc, animated: animated)
      }
    }
    
    /**
    Pops view controllers until the specified view controller is at the top of the navigation stack with a custom transition.
    - Parameters:
       -  viewController: The view controller that you want to be at the top of the stack. This view controller must currently be on the navigation stack.
    */
    func customPopToViewController(viewController vc: UIViewController, direction: VCTransition = .fromTop, transitionType: CATransitionType = .push) {
        self.addTransition(transitionDirection: direction, transitionType: transitionType)
        self.popToViewController(vc, animated: false)
    }
    
    
    // MARK: POP TO ROOT
    func customPopToRootViewController(direction: VCTransition = .fromTop, transitionType: CATransitionType = .push) {
        self.addTransition(transitionDirection: direction, transitionType: transitionType)
        self.popToRootViewController(animated: false)
    }
    

    // MARK: - PUSH VC
    /**
     Push a new view controller on the view controllers's stack.
     - Parameter vc: view controller to push.
     */
    func customPushViewController(viewController vc: UIViewController, direction: VCTransition = .fromBottom, transitionType: CATransitionType = .push) {
        self.addTransition(transitionDirection: direction, transitionType: transitionType)
        self.pushViewController(vc, animated: false)
    }

    
    // MARK: - Transitions
    private func addTransition(transitionDirection direction: VCTransition, transitionType: CATransitionType = .push, duration: CFTimeInterval = _durationTime) {
        let transition = CATransition()
        transition.duration = duration
        transition.type = transitionType
        transition.timingFunction = .init(name: .easeInEaseOut)
        switch direction {
        case .fromTop:
            transition.subtype = .fromTop
        case .fromBottom:
            transition.subtype = .fromBottom
        case .fromLeft:
            transition.subtype = .fromLeft
        case .fromRight:
            transition.subtype = .fromRight
        }

        self.view.layer.add(transition, forKey: kCATransition)
    }
}

