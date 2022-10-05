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
    
    
    func fetchData(from url: String,
                   completion: @escaping(Result<FetchMars, NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "no error description")
                return
            }
            
            do  {
                let manifest = try JSONDecoder().decode(FetchMars.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(manifest))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
