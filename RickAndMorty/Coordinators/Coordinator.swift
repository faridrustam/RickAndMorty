//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 13.10.25.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}
