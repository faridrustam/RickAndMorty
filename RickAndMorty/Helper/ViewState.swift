//
//  ViewState.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 13.10.25.
//

import Foundation

enum ViewState {
    case loading
    case loaded
    case success
    case error(String)
    case idle
}
