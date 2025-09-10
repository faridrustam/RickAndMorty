//
//  BaseController.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 10.09.25.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
    func configureUI() {}
    func configureConstraints() {}
    func configureViewModel() {}
}
