//
//  CharacterDetailCoordinator.swift
//  RickAndMortyApp
//
//  Created by Mac on 05.06.25.
//

import UIKit

final class CharacterDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let title: String
    private let characherData: AllCharacterResult
    
    init(navigationController: UINavigationController, title: String, characherData: AllCharacterResult) {
        self.navigationController = navigationController
        self.title = title
        self.characherData = characherData
    }
    
    func start() {
        let controller = CharacterDetailController(vm: CharacterDetailViewModel(characterData: characherData))
        controller.title = title
        controller.navigationItem.largeTitleDisplayMode = .never
        navigationController.show(controller, sender: nil)
    }
}
