//
//  LoginViewController.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 04/10/2023.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Variables
    var viewModel: LoginViewModel!
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: IBActions
    @IBAction func loginTapped(_ sender: UIButton) {
        viewModel.performLogin()
    }
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        viewModel.navigateToForgotPassword()
    }
    
    @IBAction func noAccountTapped(_ sender: UIButton) {
        viewModel.navigateToRegister()
    }
}

// MARK: - Disposable Protocol
extension LoginViewController: DisposableViewController {
    
    func cleanUp() {
        print("Cancelled LoginVC API calls")
    }
}
