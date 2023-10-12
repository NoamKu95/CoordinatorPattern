//
//  ForgotPasswordViewController.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 05/10/2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    // MARK: - Variables
    var viewModel: ForgotPasswordViewModel!
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - IBActions
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        viewModel.sendNewPassword()
    }
}


// MARK: - Disposable Protocol
extension ForgotPasswordViewController: DisposableViewController {
    
    func cleanUp() {
        print("Cancel ForgotPasswordVC API calls ")
    }
}
