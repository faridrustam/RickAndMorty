//
//  NetworkManger.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 10.09.25.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func sendRequest<T: Codable>(url: String, model: T.Type, method: Methods = .get) async throws -> T {
        guard let url = URL(string: url) else { throw NetworkError.invalidURL }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else { throw NetworkError.invalidResponse }
        
        guard (200...299).contains(httpResponse.statusCode) else { throw NetworkError.invalidStatusCode(httpResponse.statusCode) }
        
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch {
            throw NetworkError.invalidData
        }
    }
}
