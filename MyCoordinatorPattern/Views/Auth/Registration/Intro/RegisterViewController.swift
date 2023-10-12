//
//  RegisterViewController.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 04/10/2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Variables
    var viewModel: RegistrationViewModel!

    
    // MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - IBActions
    @IBAction func termsAndConditionsTapped(_ sender: UIButton) {
        viewModel.termsAndConditions()
    }
    
    @IBAction func continueTapped(_ sender: UIButton) {
        viewModel.registerIntroFinished()
    }
    
    @IBAction func haveAccountTapped(_ sender: UIButton) {
        viewModel.navigateToLogin()
    }
}
