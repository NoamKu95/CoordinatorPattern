//
//  RegistrationSummaryViewController.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 07/10/2023.
//

import UIKit

class RegistrationSummaryViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var summaryLbl: UILabel!
    
    
    // MARK: - Variables
    var viewModel: RegistrationSummaryViewModel!
    var authRepository = AuthRepository()
    
    private var tasks: [Task<Void, Never>]?
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let user = viewModel?.user else { return }
        
        summaryLbl.text = """
            Gender: \(String(describing: user.gender?.rawValue))
            Height: \(String(describing: user.height))
            Weight: \(String(describing: user.weight))
            Goals: \(String(describing: user.goals))
        """
    }
    
    
    // MARK: - Functions
    @MainActor
    func performRegistration() {
        guard let user = viewModel?.user else { return }
        
        let task = Task {
            do {
                let user = try await authRepository.register(newUser: user)
                viewModel.performRegistration()
            } catch let error {
                print(error.localizedDescription)
            }
        }
        tasks?.append(task)
    }
    
    
    // MARK: - IBActions
    @IBAction func signUpTapped(_ sender: UIButton) {
        performRegistration()
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        viewModel.registrationSummaryAborted()
    }
}


// MARK: - Disposable Protocol
extension RegistrationSummaryViewController: DisposableViewController {
    
    func cleanUp() {
        print("Cancelled RegistrationSummaryVC API calls")
    }
}
