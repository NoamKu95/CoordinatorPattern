//
//  ViewController.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 02/10/2023.
//

import UIKit

class SplashScreenViewController: UIViewController {

    var viewModel: SplashViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // .. initialize stuff, fetch needed data and do anything needed inside the app ..
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.viewModel.removeSpashScreen()
        }
    }
}

