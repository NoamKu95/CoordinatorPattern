//
//  WeightSelectionViewController.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 07/10/2023.
//

import UIKit

class WeightSelectionViewController: UIViewController {

    // MARK: - variables
    var viewModel: WeightSelectionViewModel!
    
    
    // MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - IBActions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        viewModel.user.weight = nil
        viewModel.weightSelectionAborted()
    }
    
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        viewModel.user.weight = 85
        viewModel.weightSelectionFinished()
    }
}
