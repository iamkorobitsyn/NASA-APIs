//
//  NetworkManager.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 10.09.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchLibrary(from url: String,
                      completion: @escaping(Result<FetchLibrary, NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data = data, let responce = responce else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "no error description")
                return
            }
            
            guard url == responce.url else {return}
            
            do {
                let library = try JSONDecoder().decode(FetchLibrary.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(library))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}

