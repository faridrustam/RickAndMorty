//
//  CharacterManager.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 13.10.25.
//

import Foundation

protocol CharactersManagerUseCase {
    func fetchAllCharacters(page: Int) async throws -> AllCharacter
}

final class CharactersManager: CharactersManagerUseCase {
    
    func fetchAllCharacters(page: Int) async throws -> AllCharacter {
        let helper = NetworkHelper(endpoint: .character, page: page)
        do {
            let item = try await NetworkManager.shared.sendRequest(url: helper.requestURLbyPage, model: AllCharacter.self)
            print(helper.requestURLbyPage)
            return item
        } catch {
            print(helper.requestURLbyPage)
            throw error
        }
    }
    
    
}
