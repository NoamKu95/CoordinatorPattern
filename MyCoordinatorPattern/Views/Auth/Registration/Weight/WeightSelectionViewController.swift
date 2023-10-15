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
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var weightPicker: UIPickerView!
    
    
    // MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        weightPicker.dataSource = self
        weightPicker.delegate = self
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

extension WeightSelectionViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return viewModel.pickerData[row]
    }
}
