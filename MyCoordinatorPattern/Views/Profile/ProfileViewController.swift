//
//  ProfileViewController.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 05/10/2023.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Variables
    weak var viewModel: ProfileViewModel!
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: IBActions
    @IBAction func termsAndConditionsTapped(_ sender: UIButton) {
        viewModel.termsAndConditions()
    }
}


// MARK: - Disposable Protocol
extension ProfileViewController: DisposableViewController {
    
    func cleanUp() {
        print("Cancell ProfileVC API calls")
    }
}
