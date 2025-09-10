//
//  NetworkHelper.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 10.09.25.
//

import Foundation

final class NetworkHelper {
    private let baseUrl = "https://rickandmortyapi.com/api"
    private let endpoint: URLEndpoint
    
    init(endpoint: URLEndpoint) {
        self.endpoint = endpoint
    }
    
    var requestURL: String {
        baseUrl + endpoint.rawValue
    }
}
