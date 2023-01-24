//
//  ViewController.swift
//  TwoSuns
//
//  Created by Александр Коробицын on 22.04.2022.
//

import UIKit

class StartViewController: UIViewController, UITextFieldDelegate, CAAnimationDelegate {
    
    private var firstStarShape = CAShapeLayer()
    private var secondStarShape = CAShapeLayer()

    @IBOutlet weak var ringContains: UIView!
    @IBOutlet weak var firstRing: UIImageView!
    @IBOutlet weak var secondRing: UIImageView!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    //MARK: - View life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ringContains.backgroundColor = .none
        buttonSettings()
        instanceCALayers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateRing(image: firstRing)
        animateRing(image: secondRing)
        buttonOpacity(button: buttonOutlet)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        firstRing.stopAnimating()
        secondRing.stopAnimating()
        self.view.layer.removeAllAnimations()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - Button Metods
    
    private func buttonSettings() {
        buttonOutlet.backgroundColor = .none
        buttonOutlet.layer.cornerRadius = 15
        buttonOutlet.layer.borderWidth = 1
        buttonOutlet.layer.borderColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        buttonOutlet.titleLabel?.textColor = .white
        buttonOutlet.titleLabel?.alpha = 0.7
        buttonOutlet.titleLabel?.font = .systemFont(ofSize: 25, weight: .thin)
    }
    
    @IBAction func buttonPressing(_ sender: UIButton) {
        firstRing.layer.speed = 7
        secondRing.layer.speed = 7
        animateStars(shapeOne: firstStarShape, shapeTwo: secondStarShape)
        viewOpacity(UIView: self.view)
    }
    
    //MARK: - Instance CALayers
    
    private func instanceCALayers() {
        view.layer.insertSublayer(Shaper.instance.returnGradient(view: self.view), at: 0)
        
        firstStarShape = Shaper.instance.starFrame(view: self.view, offset: 0)
        secondStarShape = Shaper.instance.starFrame(view: self.view, offset: 150)
        firstStarShape.strokeColor? = .init(gray: 0, alpha: 0)
        secondStarShape.strokeColor? = .init(gray: 0, alpha: 0)
        
        view.layer.insertSublayer(firstStarShape, at: 1)
        view.layer.insertSublayer(secondStarShape, at: 2)
    }
    
    //MARK: - Animations
    
    private func animateRing(image: UIImageView) {
        let CAGroup = Animator.instance.rotation(to: .pi * 2.0)
        image.layer.add(CAGroup, forKey: nil)
    }
    
    private func buttonOpacity(button: UIButton) {
        let CAGroup = Animator.instance.opacity()
        button.layer.add(CAGroup, forKey: nil)
    }
    
    private func animateStars(shapeOne: CAShapeLayer, shapeTwo: CAShapeLayer) {
        shapeOne.strokeColor? = .init(gray: 1, alpha: 0.5)
        shapeTwo.strokeColor? = .init(gray: 1, alpha: 0.5)
        let one = Animator.instance.animateFallenStar(delay: 0)
        let two = Animator.instance.animateFallenStar(delay: 0.5)
        shapeOne.add(one, forKey: nil)
        shapeTwo.add(two, forKey: nil)
    }
    
    private func viewOpacity(UIView: UIView) {
        let CAGroup = Animator.instance.opacityVC()
        CAGroup.delegate = self
        UIView.layer.add(CAGroup, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.view.alpha = 0
        performSegue(withIdentifier: "earthID", sender: nil)
    }
}

