//
//  TableImageView.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 21.10.2022.
//

import UIKit
extension UIImageView {
    
    func fetchImage(from url: String, cash: Bool, completion: @escaping () -> Void) {
        guard let url = URL(string: url) else {
            image = nil
            return
        }
        
        if let cachedImage = getCachedImage(from: url) {
            image = cachedImage
            completion()
            return
        }

        URLSession.shared.dataTask(with: url) { data, respounce, error in
            guard let data = data, let respounce = respounce else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            guard url == respounce.url else { return }
            
            if cash == true {
                self.saveDataToCache(with: data, and: respounce)
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                completion()
            }
        }.resume()

    }

    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        let request = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: request)
    }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
}

