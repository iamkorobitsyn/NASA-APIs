//
//  CAGradientLayer.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 25.10.2022.
//

import UIKit

class Shaper {
    
    static let instance = Shaper()
    
    private init() {}
    
    //MARK: - Create Gradient
    
    func returnGradient(view: UIView) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        view.layer.insertSublayer(gradient, at: 0)
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.frame = CGRect(x: 0, y: 0, width: view.frame.width,
                                height: view.frame.height)
        gradient.colors = [UIColor.downGradient.cgColor,
                           UIColor.upGradient.cgColor]
        return gradient
    }
    
    //MARK: - Create Shapes
    
    func starFrame(view: UIView, offset: Int) -> CAShapeLayer {

        let shape = ThinLineShape()
        shape.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.width / 2 + CGFloat(offset) ,
                              y: view.frame.height / 8))
        path.addLine(to: CGPoint(x: view.frame.width / 4 + CGFloat(offset) ,
                                 y: view.frame.height / 4))
        shape.path = path.cgPath
        return shape
    }
    
    func firstLineFrame(view: UIView) -> CAShapeLayer {
        
        let shape = ThinLineShape()
        shape.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.width / 2 , y: view.frame.height / 2 + 60))
        path.addLine(to: CGPoint(x: view.frame.width / 2 + 115, y: view.frame.height / 2 + 60))
        shape.path = path.cgPath
        return shape
    }
    
    func secondLineFrame(view: UIView) -> CAShapeLayer {
        
        let shape = ThinLineShape()
        shape.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.width / 2 + 50, y: view.frame.height / 2 + 24))
        path.addLine(to: CGPoint(x: view.frame.width / 2 + -60, y: view.frame.height / 2 + 24))
        shape.path = path.cgPath
        return shape
    }
    
    func ISSPillingFrame(view: UIView) -> CAShapeLayer {
        let shape = ThinLineShape()
        shape.frame = view.bounds
        shape.lineWidth = 3
        let path = UIBezierPath(arcCenter: CGPoint(x: view.frame.width / 2 + 40,
                                                   y: view.frame.height / 2 + 16), radius: 0.2, startAngle: 50, endAngle: 100, clockwise: true)
        shape.path = path.cgPath
        return shape
    }

    
    func thirdlineFrame(view: UIView) -> CAShapeLayer {
        let shape = ThinLineShape()
        shape.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.width / 2 - 100 , y: view.frame.height / 2 + 18))
        path.addLine(to: CGPoint(x: view.frame.width / 2 + 50, y: view.frame.height / 2 + 18))
        shape.path = path.cgPath
        return shape
    }
    
    func probesPilling(view: UIView) -> CAShapeLayer {
        let shape = ThinLineShape()
        shape.frame = view.bounds
        shape.lineWidth = 3
        shape.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        let path = UIBezierPath(arcCenter: CGPoint(x: view.frame.width / 2 - 95,
                                                   y: view.frame.height / 2 + 10 ), radius: 0.2, startAngle: 50, endAngle: 100, clockwise: true)
        shape.path = path.cgPath
        return shape
    }
    
    func fourthLineFrame(view: UIView) -> CAShapeLayer {
        let shape = ThinLineShape()
        shape.frame = view.bounds
        shape.strokeColor = UIColor.black.withAlphaComponent(0.8).cgColor
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.width , y: view.frame.height ))
        path.addLine(to: CGPoint(x: view.frame.width / 2.3, y: view.frame.height / 2.3))
        shape.path = path.cgPath
        return shape
    }
    
    

}
