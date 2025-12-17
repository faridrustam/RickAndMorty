//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 17.12.25.
//

import Foundation

final class CharacterDetailViewModel {
    private(set) var characterData: AllCharacterResult
    
    init(characterData: AllCharacterResult) {
        self.characterData = characterData
    }
}
