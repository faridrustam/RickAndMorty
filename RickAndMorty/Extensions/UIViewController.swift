//
//  UIViewController.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 13.10.25.
//
import UIKit

extension UIViewController {
    func showAlert(with title: String = "Error", and message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
