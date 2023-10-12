//
//  Disposable.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 04/10/2023.
//

import Foundation

/// All view controllers that perform tasks which should be cancelled once the view controller is dismissed should conform to this protocol.
protocol DisposableViewController: NSObjectProtocol {
    func cleanUp()
}
