//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 17.12.25.
//

import Foundation

struct InfoItem {
    var title: InfoTitles
    var icon: String
    var data: String
    var isClickable: Bool
}

enum InfoTitles: String {
    case loc = "Last Known Location"
    case origin = "Origin"
    case species = "Species"
    case gender = "Gender"
}

final class CharacterDetailViewModel {
    private(set) var characterData: AllCharacterResult
    private(set) var infoItems: [InfoItem] = []
    
    init(characterData: AllCharacterResult) {
        self.characterData = characterData
    }
    
    func getInfoItems() {
        infoItems = [
            .init(title: .loc, icon: "location.fill", data: characterData.location?.name ?? "", isClickable: true),
            .init(title: .origin, icon: "globe", data: characterData.origin?.name ?? "", isClickable: true),
            .init(title: .species, icon: "eye", data: characterData.species ?? "", isClickable: false),
            .init(title: .gender, icon: "person.fill", data: characterData.gender?.rawValue ?? "", isClickable: false)
        ]
    }
}
