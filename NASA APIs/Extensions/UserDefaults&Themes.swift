//
//  UserDefaults&Themes.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 18.10.2022.
//

import Foundation
import UIKit

struct MTUserDevaults {
    
    static var shared = MTUserDevaults()
    
    var theme: Theme {
        get {
            Theme(rawValue: UserDefaults.standard.integer(forKey: "selectedTheme")) ?? .device
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedTheme")
        }
    }
}

enum Theme: Int {
    case device
    case light
    case dark
    
    func getUserInterfaceStyle() -> UIUserInterfaceStyle {
        switch self {
        case.device:
            return .unspecified
        case.light:
            return .light
        case.dark:
            return .dark
        }
    }
}

