//
//  HomeControllerViewModel.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 13.10.25.
//

import Foundation

final class HomeViewModel {
    
    private let charactersManager = CharactersManager()
    private(set) var data = [AllCharacterResult]()
    private var info: AllCharacter?
    var sendState: ((ViewState) -> Void)?
    private var page: Int = 1
    
    private var state: ViewState = .idle {
        didSet {
            sendState?(state)
        }
    }
    
    func fetchCharacters() {
        Task {
            state = .loading
            do {
                
                info = try await charactersManager.fetchAllCharacters(page: page)
                data.append(contentsOf: info?.results ?? [])
                state = .loaded
                state = .success
            } catch {
                state = .error(error.localizedDescription)
                state = .loaded
            }
        }
    }
    
    func refreshCharacters() {
        data.removeAll()
        fetchCharacters()
    }
    
    func pagination(index: Int) {
        if index == data.count - 2 {
            page += 1
            fetchCharacters()
        }
    }
}
