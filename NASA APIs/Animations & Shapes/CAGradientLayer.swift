//
//  CAGradientLayer.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 25.10.2022.
//

import Foundation
import UIKit

class Gradient {
    func returnGradient(view: UIView, endY: Double) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        view.layer.insertSublayer(gradient, at: 0)
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: endY)
        gradient.frame = CGRect(x: 0, y: 0, width: view.frame.width,
                                height: view.frame.height)
        gradient.colors = [UIColor.downGradient.cgColor,
                           UIColor.upGradient.cgColor]
        return gradient
    }
}
