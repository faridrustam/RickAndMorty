//
//  HomeControllerViewModel.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 13.10.25.
//

import Foundation

final class HomeViewModel {
    
    private let charactersManager = CharactersManager()
    private(set) var characters = [AllCharacterResult]()
    var sendState: ((ViewState) -> Void)?
    
    private var state: ViewState = .idle {
        didSet {
            sendState?(state)
        }
    }
    
    func fetchCharacters() {
        Task {
            state = .loading
            do {
                characters = try await charactersManager.fetchAllCharacters().results ?? []
                state = .loaded
                state = .success
            } catch {
                state = .error(error.localizedDescription)
                state = .loaded
            }
        }
    }
    
    func refresh() {
        characters.removeAll()
        fetchCharacters()
    }
}
