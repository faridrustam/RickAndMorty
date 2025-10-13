//
//  CharacterManager.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 13.10.25.
//

import Foundation

protocol CharactersManagerUseCase {
    func fetchAllCharacters() async throws -> AllCharacter
}

final class CharactersManager: CharactersManagerUseCase {
    
    func fetchAllCharacters() async throws -> AllCharacter {
        let helper = NetworkHelper(endpoint: .character)
        
        do {
            let item = try await NetworkManager.shared.sendRequest(url: helper.requestURL, model: AllCharacter.self)
            
            return item
        } catch {
            throw error
        }
    }
}
