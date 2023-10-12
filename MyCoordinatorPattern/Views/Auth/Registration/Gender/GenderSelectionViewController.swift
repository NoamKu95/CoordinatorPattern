//
//  GenderSelectionViewController.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 07/10/2023.
//

import UIKit

class GenderSelectionViewController: UIViewController {

    // MARK: - variables
    var viewModel: GenderSelectionViewModel!
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: IBActions
    @IBAction func maleGenderTapped(_ sender: UIButton) {
        viewModel.user.gender = .male
    }
    
    @IBAction func femaleGenderTapped(_ sender: UIButton) {
        viewModel.user.gender = .female
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        viewModel.user.gender = nil
        viewModel.genderSelectionAborted()
    }
    
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        viewModel.genderSelectionFinished()
    }
}
