//
//  HeightSelectionViewController.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 07/10/2023.
//

import UIKit

class HeightSelectionViewController: UIViewController {

    // MARK: - variables
    var viewModel: HeightSelectionViewModel!

    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - IBActions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        viewModel.user.height = nil
        viewModel.heightSelectionAborted()
    }
    
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        viewModel.user.height = 175
        viewModel.heightSelectionFinished()
    }
}
