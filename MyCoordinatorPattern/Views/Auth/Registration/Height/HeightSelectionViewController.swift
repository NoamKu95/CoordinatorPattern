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

    
    // MARK: - IBOutlets
    @IBOutlet weak var heightPicker: UIPickerView!
    
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        heightPicker.dataSource = self
        heightPicker.delegate = self
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

extension HeightSelectionViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
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
