//
//  TableImageView.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 21.10.2022.
//

import Foundation
import UIKit
extension UIImageView {
    
    func fetchImage(from url: String, completion: @escaping () -> Void) {
        guard let url = URL(string: url) else {
            image = nil
            return
        }
        
        //        Используем изображение из кеша, если оно там есть
        
        if let cachedImage = getCachedImage(from: url) {
            image = cachedImage
            completion()
            return
        }
        
        ImageManager.shared.fetchImage(from: url) { data, response in
            self.image = UIImage(data: data)
            completion()
        }
    }
    
    //         Используем изображение из кеша, если оно там есть
    
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        let request = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: request)
    }
    
    //    Если изображения нет, то грузим его из сети
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
}

