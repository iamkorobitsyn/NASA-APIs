//
//  CABasicAnimations.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 12.05.2022.
//

import UIKit

class Animator {
    
    static let instance = Animator()
    private init() {}
    
    //MARK: - StartViewController
    
    func rotation(to: Double) -> CAAnimationGroup {
        var rotation = [CABasicAnimation]()
        
        let beginning: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        beginning.timingFunction = CAMediaTimingFunction(name: .easeIn)
        beginning.beginTime = 0.0
        beginning.duration = 5.0
        beginning.toValue = to
        rotation.append(beginning)
        
        let ending: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        ending.timingFunction = CAMediaTimingFunction(name: .linear)
        ending.beginTime = 5.0
        ending.duration = 2.5
        ending.toValue = to
        ending.isCumulative = true
        
        ending.repeatCount = .infinity
        rotation.append(ending)
        
        let CAGroup = CAAnimationGroup()
        
        CAGroup.duration = .greatestFiniteMagnitude
        CAGroup.repeatCount = .infinity
        
        CAGroup.animations = rotation
        
        return CAGroup
        
    }
    
    func opacity() -> CAAnimation {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1.5
        return animation
    }
    
    func opacityVC() -> CAAnimationGroup {
        
        var opacity = [CABasicAnimation]()
        
        let beginning: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        beginning.fromValue = 1.0
        beginning.toValue = 1.0
        beginning.duration = 1.5
        
        opacity.append(beginning)
        
        let ending: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        ending.beginTime = 1.5
        ending.fromValue = 1.0
        ending.toValue = 0
        ending.duration = 0.5
        
        
        opacity.append(ending)
        
        let CAGroup = CAAnimationGroup()
       
        CAGroup.duration = 2.0
        CAGroup.animations = opacity
        
        
        return CAGroup
    }
    
    func animateFallenStar(delay: Double) -> CAAnimationGroup {
        
        var starAnimate = [CABasicAnimation]()
        
        let strokeEnd: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        strokeEnd.fromValue = 0
        strokeEnd.toValue = 0
        strokeEnd.duration = 0.5 + delay
        
        starAnimate.append(strokeEnd)
        
        let beginningOpacity: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        beginningOpacity.beginTime = 0.5 + delay
        beginningOpacity.duration = 0.5 + delay
        beginningOpacity.fromValue = 0.8
        beginningOpacity.toValue = 0
        
        starAnimate.append(beginningOpacity)
        
        let endingOpacity: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        endingOpacity.beginTime = 1.0 + delay
        endingOpacity.duration = 1.5 + delay
        endingOpacity.fromValue = 0
        endingOpacity.toValue = 0
        
        starAnimate.append(endingOpacity)
        
        let CAGroup = CAAnimationGroup()
        
        CAGroup.duration = 2.5 + delay
        CAGroup.animations = starAnimate
        
        return CAGroup
    }
    
    //MARK: - DislocationViewController
    
    func animateLine() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 1.5
        return animation
    }
    
    func animatePilling() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeColor")
        animation.fromValue = .none
        animation.toValue = UIColor.green.cgColor
        animation.duration = 1.5
        animation.repeatCount = .greatestFiniteMagnitude
        return animation
    }
 
    func animateSun() -> CAAnimationGroup {
        var animation = [CABasicAnimation]()
        
        let firstPhase = CABasicAnimation(keyPath: "opacity")
        firstPhase.duration = 1.0
        firstPhase.fromValue = 1.0
        firstPhase.toValue = 0.0
        animation.append(firstPhase)
        
        let secondPhase = CABasicAnimation(keyPath: "opacity")
        secondPhase.beginTime = 1.0
        secondPhase.duration = 2.0
        secondPhase.fromValue = 0.0
        secondPhase.toValue = 1.0
        animation.append(secondPhase)
        
        let thirdPhase = CABasicAnimation(keyPath: "transform.scale")
        thirdPhase.beginTime = 2.0
        thirdPhase.fromValue = 1.0
        thirdPhase.toValue = 1.05
        thirdPhase.duration = 1.0
        animation.append(thirdPhase)
        
        let fourhPhase = CABasicAnimation(keyPath: "transform.scale")
        fourhPhase.beginTime = 3.0
        fourhPhase.fromValue = 1.05
        fourhPhase.toValue = 1.0
        fourhPhase.duration = 1.0
        animation.append(fourhPhase)
        
        let CAGroup = CAAnimationGroup()
        CAGroup.duration = 4.0
        CAGroup.repeatCount = .infinity
        CAGroup.animations = animation
        
        return CAGroup
    }
    
}
