//
//  CAShapeLayer + Extension.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 20.11.2022.
//

import UIKit

class ThinLineShape: CAShapeLayer {
    override init() {
        super.init()
        baseSetup()
    }
    override init(layer: Any) {
        super.init(layer: layer)
        baseSetup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func baseSetup() {
        lineWidth = 0.2
        lineCap = .round
        fillColor = nil
        strokeEnd = 1
        strokeColor = UIColor.whiteColor.withAlphaComponent(1).cgColor
    }
}
