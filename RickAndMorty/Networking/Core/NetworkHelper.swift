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
    private let page: Int
    
    init(endpoint: URLEndpoint, page: Int = 1) {
        self.endpoint = endpoint
        self.page = page
    }
    
    var requestURL: String {
        baseUrl + endpoint.rawValue
    }
    
    var requestURLbyPage: String {
        baseUrl + endpoint.rawValue + "?page=\(page)"
    }
}
