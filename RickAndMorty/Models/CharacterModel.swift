//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 13.10.25.
//

import Foundation

// MARK: - Order
struct AllCharacter: Codable {
    let info: AllCharacterInfo?
    let results: [AllCharacterResult]?
}

// MARK: - Info
struct AllCharacterInfo: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct AllCharacterResult: Codable {
    let id: Int?
    let name: String?
    let status: Status?
    let species: Species?
    let type: String?
    let gender: AllCharacterGender?
    let origin, location: AllCharacterLocation?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum AllCharacterGender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct AllCharacterLocation: Codable {
    let name: String?
    let url: String?
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
