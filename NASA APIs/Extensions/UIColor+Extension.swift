//
//  UIColor+Extension.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 22.05.2022.
//

import UIKit

extension UIColor {
    convenience init(r:CGFloat, g:CGFloat, b:CGFloat, alpha:CGFloat = 1) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    static let whiteColor: UIColor = .init(r: 255, g: 255, b: 255)
    static let upGradient: UIColor = .init(r: 104, g: 122, b: 147)
    static let downGradient: UIColor = .init(r: 12, g: 14, b: 17)
    
}




