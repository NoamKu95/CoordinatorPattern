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
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var goalsTable: UITableView!
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        goalsTable.dataSource = self
        goalsTable.delegate = self
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

extension GoalsSelectionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let label = UILabel(frame: cell.bounds)
        label.text = viewModel.tableData[indexPath.row]
        let padding: CGFloat = 15
        label.frame = CGRect(x: 15, y: 0, width: cell.contentView.frame.width - 2 * padding, height: cell.contentView.frame.height)
        
        cell.contentView.addSubview(label)
        
        return cell
    }
}
