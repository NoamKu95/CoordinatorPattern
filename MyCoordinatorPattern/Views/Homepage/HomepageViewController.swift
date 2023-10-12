//
//  HomepageViewController.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 04/10/2023.
//

import UIKit

class HomepageViewController: UIViewController {

    // MARK: - Variables
    weak var viewModel: HomepageViewModel!
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// MARK: - Disposable Protocol
extension HomepageViewController: DisposableViewController {
    
    func cleanUp() {
        print("Cancell HomepageVC API calls")
    }
}
