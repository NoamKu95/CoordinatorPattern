//
//  TermsAndConditionsViewController.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 09/10/2023.
//

import UIKit

class TermsAndConditionsViewController: UIViewController {
    
    // MARK: Variables
    var viewModel: TermsAndConditionsViewModel?
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: IBActions
    @IBAction func backBtnTapped(_ sender: Any) {
        viewModel?.dismissScreen()
    }
}
