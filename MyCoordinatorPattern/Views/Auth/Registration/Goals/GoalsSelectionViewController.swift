//
//  GoalsSelectionViewController.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 07/10/2023.
//

import UIKit

class GoalsSelectionViewController: UIViewController {

    // MARK: - Variables
    var viewModel: GoalsSelectionViewModel!
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - IBActions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        viewModel.user.goals = []
        viewModel.goalsSelectionAborted()
    }
    
    
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        viewModel.user.goals = ["Goal1", "Goal2"]
        viewModel.goalsSelectionFinished()
    }
}
