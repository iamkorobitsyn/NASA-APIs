//
//  Create objects.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 13.05.2022.
//

import QuartzCore
import UIKit

//let sizeBar = CustomTabBarTransfer()

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
        strokeColor = UIColor.whiteColor.withAlphaComponent(0).cgColor
    }
}

class ShapeBezier {
    
    //MARK: - StartViewController
    
    func firstStarFrame(shapeLayer: CAShapeLayer, view: UIView) {

        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.width / 5 , y: view.frame.height / 5))
        path.addLine(to: CGPoint(x: view.frame.width / 2, y: view.frame.height / 9))
        shapeLayer.path = path.cgPath
    }

    func secondStarFrame(shapeLayer: CAShapeLayer, view: UIView) {

        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.width / 2 + 60 , y: view.frame.height / 5))
        path.addLine(to: CGPoint(x: view.frame.width / 2 + 150, y: view.frame.height / 8))
        shapeLayer.path = path.cgPath
    }
    
    //MARK: - MainViewController
    
    func firstLineFrame(shapeLayer: CAShapeLayer, view: UIView) {
        
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.width / 2 + -170, y: view.frame.height / 2))
        path.addLine(to: CGPoint(x: view.frame.width / 2 + -170, y: view.frame.height / 2 + -50))
        path.addCurve(to: CGPoint(x: view.frame.width / 2 + -140, y: view.frame.height / 2 + -80),
                      controlPoint1: CGPoint(x: view.frame.width / 2 + -170, y: view.frame.height / 2 + -70 ),
                      controlPoint2: CGPoint(x: view.frame.width / 2 + -160, y: view.frame.height / 2 + -80 ))
        path.addLine(to: CGPoint(x: view.frame.width / 2 + 170, y: view.frame.height / 2 + -80))
        shapeLayer.path = path.cgPath
    }
    
    func secondLineFrame(shapeLayer: CAShapeLayer, view: UIView) {
        
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.width / 2 + 50, y: view.frame.height / 2 - 10))
        path.addLine(to: CGPoint(x: view.frame.width / 2 + 50, y: view.frame.height / 2 + 20))
        path.addCurve(to: CGPoint(x: view.frame.width / 2 + 20, y: view.frame.height / 2 + 50),
                      controlPoint1: CGPoint(x: view.frame.width / 2 + 50, y: view.frame.height / 2 + 30 ),
                      controlPoint2: CGPoint(x: view.frame.width / 2 + 50, y: view.frame.height / 2 + 50 ))
        path.addLine(to: CGPoint(x: view.frame.width / 2 + -80, y: view.frame.height / 2 + 50))
        shapeLayer.path = path.cgPath
    }
    
    func thirdlineFrame(shapeLayer: CAShapeLayer, view: UIView) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.width / 2 - 30, y: view.frame.height / 2 - 30))
        path.addLine(to: CGPoint(x: view.frame.width / 2 + 85, y: view.frame.height / 2 - 30))
        shapeLayer.path = path.cgPath
    }
    
    func ISSPilling(shapeLayer: CAShapeLayer, view: UIView) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath(arcCenter: CGPoint(x: view.frame.width / 2 + 35, y: view.frame.height / 2 + 2), radius: 0.2, startAngle: 50, endAngle: 100, clockwise: true)
        shapeLayer.path = path.cgPath
    }
    
    func probesPilling(shapeLayer: CAShapeLayer, view: UIView) {
        
        let path = UIBezierPath(arcCenter: CGPoint(x: view.frame.width / 2 + 75, y: view.frame.height / 2 + -40), radius: 0.2, startAngle: 50, endAngle: 100, clockwise: true)
        shapeLayer.path = path.cgPath
    }
    
    //MARK: - EarthTabBarController
    
    func tabCirclePath(shapeLayer: CAShapeLayer) {
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: 0, y: 0),
                    radius: 40,
                    startAngle: .pi / 2 + .pi / 6,
                    endAngle: .pi / 2 - .pi / 6,
                    clockwise: true)
        shapeLayer.path = path.cgPath
    }
    
    func tabLinePath(shapeLayer: CAShapeLayer) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 15, y: 32))
        path.addLine(to: CGPoint(x: 65, y: 32))
        path.close()
        shapeLayer.path = path.cgPath
    }
}
