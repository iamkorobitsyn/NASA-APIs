//
//  StorageManager.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 28.10.2022.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    let userDefaults = UserDefaults.standard
    let key = "arrayOfObservers"
    
    func loadObserver() -> [String] {
        if let observer = userDefaults.value(forKey: key) as? [String] {
            return observer
        }
        return []
    }
    private init() {}
}
