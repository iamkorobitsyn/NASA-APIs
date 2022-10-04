//
//  CABasicAnimations.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 12.05.2022.
//


import QuartzCore
import UIKit


class Animator {
    
    //MARK: - StartViewController
    
    
    func animateCircleStartVC(to: Double) -> CAAnimationGroup {
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
    
    func textOpacityStartVC() -> CABasicAnimation {
        let opasity: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        opasity.fromValue = 0
        opasity.toValue = 1
        opasity.duration = 5
        return opasity
    }
    
   func buttonOpacityStartVC() -> CAAnimationGroup {
        
        var opacity = [CABasicAnimation]()
        
        let beginning: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
       
        beginning.fromValue = 0
        beginning.toValue = 0
        beginning.duration = 2
        
        opacity.append(beginning)
        
        let ending: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        
        ending.beginTime = 2
        ending.fromValue = 0
        ending.toValue = 1
        ending.duration = 0.5
        
        opacity.append(ending)
        
        let CAGroup = CAAnimationGroup()
        
        CAGroup.duration = 2.5
        
        CAGroup.animations = opacity
        
        return CAGroup
    }
    
    func viewOpacityStartVC() -> CAAnimationGroup {
        
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
    
    func firstStarAnimating() -> CAAnimationGroup {
        
        var starAnimate = [CABasicAnimation]()
        
        let strokeEnd: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        strokeEnd.fromValue = 0
        strokeEnd.toValue = 0
        strokeEnd.duration = 0.5
        
        starAnimate.append(strokeEnd)
        
        let beginningOpacity: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        beginningOpacity.beginTime = 0.5
        beginningOpacity.duration = 0.5
        beginningOpacity.fromValue = 0.8
        beginningOpacity.toValue = 0
        
        starAnimate.append(beginningOpacity)
        
        let endingOpacity: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        endingOpacity.beginTime = 1.0
        endingOpacity.duration = 1.5
        endingOpacity.fromValue = 0
        endingOpacity.toValue = 0
        
        starAnimate.append(endingOpacity)
        
        let CAGroup = CAAnimationGroup()
        
        CAGroup.duration = 2.5
        CAGroup.animations = starAnimate
        
        return CAGroup
    }
    
    func secondStarAnimating() -> CAAnimationGroup {
        
        var starAnimate = [CABasicAnimation]()
        
        let strokeEnd: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        strokeEnd.fromValue = 0
        strokeEnd.toValue = 0
        strokeEnd.duration = 1.1
        
        starAnimate.append(strokeEnd)
        
        let beginningOpacity: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        beginningOpacity.beginTime = 1.1
        beginningOpacity.duration = 0.5
        beginningOpacity.fromValue = 0.8
        beginningOpacity.toValue = 0
        
        starAnimate.append(beginningOpacity)
        
        let endingOpacity: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        endingOpacity.beginTime = 1.6
        endingOpacity.duration = 0.9
        endingOpacity.fromValue = 0
        endingOpacity.toValue = 0
        
        starAnimate.append(endingOpacity)
        
        let CAGroup = CAAnimationGroup()
        
        CAGroup.duration = 2.5
        CAGroup.animations = starAnimate
        
        return CAGroup
    }
    
    //MARK: - MainViewController
    
    func animateLine() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 1.5
        return animation
    }
    
    func pillingAnimate() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeColor")
        animation.fromValue = .none
        animation.toValue = UIColor.green.cgColor
        animation.duration = 1.5
        animation.repeatCount = .greatestFiniteMagnitude
        return animation
    }
    
    func moveAnimate() -> CAAnimationGroup {
        var animation = [CABasicAnimation]()
        
        let firstMove: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation")
        firstMove.beginTime = 0.0
        firstMove.fromValue = CGSize(width: 0, height: 0)
        firstMove.toValue = CGSize(width: 8, height: 8)
        firstMove.duration = 0.5
        animation.append(firstMove)
        
        let secondMove: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation")
        secondMove.beginTime = 0.5
        secondMove.fromValue = CGSize(width: 8, height: 8)
        secondMove.toValue = CGSize(width: 5, height: 5)
        secondMove.duration = 0.5
        animation.append(secondMove)
        
        let thirdMove: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation")
        thirdMove.beginTime = 1.0
        thirdMove.fromValue = CGSize(width: 5, height: 5)
        thirdMove.toValue = CGSize(width: 8, height: 8)
        thirdMove.duration = 0.5
        animation.append(thirdMove)
        
        let fourthMove: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation")
        fourthMove.beginTime = 1.5
        fourthMove.fromValue = CGSize(width: 8, height: 8)
        fourthMove.toValue = CGSize(width: 0, height: 0)
        fourthMove.duration = 0.5
        animation.append(fourthMove)
        
        
        let CAGroup = CAAnimationGroup()
        CAGroup.duration = 3.0
        CAGroup.repeatCount = .infinity
        CAGroup.animations = animation
        return CAGroup
    }
    
    func animateColor() -> CAAnimationGroup {
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
        
        let fourPhase = CABasicAnimation(keyPath: "transform.scale")
        fourPhase.beginTime = 3.0
        fourPhase.fromValue = 1.05
        fourPhase.toValue = 1.0
        fourPhase.duration = 1.0
        animation.append(fourPhase)
        
        let CAGroup = CAAnimationGroup()
        CAGroup.duration = 4.0
        CAGroup.repeatCount = .infinity
        CAGroup.animations = animation
        
        return CAGroup
    }
    
    //MARK: - EarthTabBarController
    
    
    func animateCircle360() -> CABasicAnimation {
        
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.timingFunction = CAMediaTimingFunction(name: .linear)
        rotation.beginTime = 0.0
        rotation.duration = 0.3
        rotation.toValue = .pi * 2.0
        return rotation
    }
    
    func fastAnimateLine() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 0.3
        return animation
    }
    
}
